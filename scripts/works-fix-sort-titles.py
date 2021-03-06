def write_line(f, apostrophe, original_title, modified_sort_title):
    image_name = modified_sort_title

    size = len(image_name)

    if image_name.endswith(', a'):
        image_name = image_name[:size - 3]
    elif image_name.endswith(', an'):
        image_name = image_name[:size - 4]
    elif image_name.endswith(', the'):
        image_name = image_name[:size - 5]

    image_name = image_name.replace(' ', '-')

    new_line = 'insert into work (title, sort_by_title, image_name, type) values ('
    new_line += apostrophe
    new_line += original_title
    new_line += apostrophe
    new_line += ', '
    new_line += apostrophe
    new_line += modified_sort_title
    new_line += apostrophe
    new_line += ", "
    new_line += apostrophe
    new_line += image_name
    new_line += apostrophe
    new_line += ", 'Novel');"
    new_line += '\n'

    f.write(new_line)


def get_sort_title(orig_title, apostrophe):
    t = orig_title.replace(apostrophe, '')

    sort_t = t.lower()

    if sort_t.startswith('a '):
        sort_t = sort_t[len('a '):] + ', a'
    elif sort_t.startswith('an '):
        sort_t = sort_t[len('an '):] + ', an'
    elif sort_t.startswith('the '):
        sort_t = sort_t[len('the '):] + ', the'

    return sort_t


file = open('../db/data/works.sql', 'r')
lines = file.readlines()

target_file = open('../db/data/works-sort-titles.sql', 'w')

for line in lines:
    # noinspection SqlNoDataSourceInspection
    if line.startswith('insert into work (title, type) values ('):
        modified_line = line.strip()
        modified_line = modified_line.replace('insert into work (title, type) values (', '')
        modified_line = modified_line.replace(", 'Novel');", '')

        if modified_line.startswith("'"):
            title = modified_line.lstrip("'").rstrip("'")

            sort_title = get_sort_title(title, "'")
            write_line(target_file, "'", title, sort_title)
        else:
            print('ERROR: ' + modified_line)
    else:
        target_file.write(line)

target_file.close()

