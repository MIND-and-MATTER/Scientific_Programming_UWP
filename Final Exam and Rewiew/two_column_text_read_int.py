def two_column_text_read(file_name):
    import numpy as np

    file = open(file_name)
    content = file.readlines()
    data = np.zeros([2, (len(content))], float)

    for line in content:
        elements = line.split()
        data[0, line-1] = float(elements[0])
        data[1, line-1] = float(elements[0])

    return data


print(two_column_text_read("volumes_energies.dat"))

