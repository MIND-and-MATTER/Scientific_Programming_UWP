import numpy as np

def two_column_text_read(file_name):

    file = open(file_name)
    content = file.readlines()
    data = np.zeros([2, (len(content))], float)
    n = 0

    for line in content:
        elements = line.split()
        data[0, n] = float(elements[0])
        data[1, n] = float(elements[1])
        n += 1

    return data


def quadratic_fit(array):

    x_values = array[0, :]
    y_values = array[1, :]

    quadratic_coefficients = np.polyfit(x_values, y_values, 3)

    return quadratic_coefficients


print(two_column_text_read("volumes_energies.dat"))
print(quadratic_fit(two_column_text_read("volumes_energies.dat")))

