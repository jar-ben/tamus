from uppaalHelpers import ta_helper
import random
import math


def disturb_automata(file_path, query_path, amount_of_parameters_to_change=1, rate_of_changes=0.2):
    query_file = open(query_path)
    query_string = query_file.read()
    qs_list = query_string.split(" ")
    qs_list = qs_list[1].split(".")
    template_instance_name = qs_list[0]
    template_name = ta_helper.get_template_name(file_path, template_instance_name)

    r_file = open(file_path, 'r')
    w_file = open(file_path[0:-4] + '_disturbed_1.xml', 'w')

    template = []
    reading_template = 0
    for line in r_file:

        if reading_template:
            template.append(line)
            if '</template>' in line:
                write_template(template, w_file, template_name, amount_of_parameters_to_change, rate_of_changes)
                template = []
                reading_template = 0

        else:
            if '<template>' in line:
                template.append(line)
                reading_template = 1
            else:
                w_file.write(line)


def write_template(template, w_file, target_template_name, amount_of_parameters_to_change, rate_of_changes):

    template_name_line = template[1]
    template_name_start = template_name_line.find('>') + 1
    template_name_end = template_name_line.find('<', template_name_start)
    template_name = template_name_line[template_name_start: template_name_end].strip()

    if target_template_name != template_name:
        for line in template:
            w_file.write(line)
        return

    c_count = 0
    for line in template:
        c_count += line.count('&gt;')
        c_count += line.count('&lt;')

    if amount_of_parameters_to_change >= c_count:
        change_choice = [1] * c_count
    else:
        change_choice = [1] * amount_of_parameters_to_change + [0] * (c_count - amount_of_parameters_to_change)
        random.shuffle(change_choice)

    for line in template:
        if "label kind=\"invariant\"" in line or "label kind=\"guard\"" in line:
            constraints_start = line.find('>') + 1
            constraints_end = line.find('<', constraints_start)
            constraints = line[constraints_start: constraints_end]
            constraints = constraints.split('&amp;&amp;')

            w_file.write(line[:constraints_start])

            result = []
            for c in constraints:
                if '&gt;' in c:
                    if change_choice[0] == 0:
                        change_choice = change_choice[1:]
                        result.append(c)
                        continue
                    t_start = c.find('&gt;')
                    if c[t_start+4] == '=':
                        t_start = t_start + 5
                    else:
                        t_start = t_start + 4

                    threshold = c[t_start:].strip()

                    c = c[:t_start]
                    c += ' ' + str(int(threshold)+int(math.ceil(rate_of_changes * int(threshold)))) + ' '
                    result.append(c)
                    change_choice = change_choice[1:]

                elif '&lt;' in c:
                    if change_choice[0] == 0:
                        change_choice = change_choice[1:]
                        result.append(c)
                        continue
                    t_start = c.find('&lt;')
                    if c[t_start+4] == '=':
                        t_start = t_start + 5
                    else:
                        t_start = t_start + 4

                    threshold = c[t_start:].strip()

                    c = c[:t_start]
                    threshold = int(math.ceil((1-rate_of_changes) * int(threshold)))
                    threshold *= (threshold > 0)
                    c += ' ' + str(threshold) + ' '
                    result.append(c)
                    change_choice = change_choice[1:]

                else:
                    result.append(c)

            w_file.write('&amp;&amp;'.join(result))
            w_file.write(line[constraints_end:])

        else:
            w_file.write(line)
