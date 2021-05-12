import numpy as np

from two_column_text_read import two_column_text_read
from bivariate_statistics import bivariate_statistics
from quadratic_fit import quadratic_fit
from fit_curve_array import fit_curve_array
from plot_data_with_fit import plot_data_with_fit
from lowest_eigenvector import lowest_eigenvector

data = two_column_text_read("volumes_energies.dat")
quadratic = quadratic_fit(data)
output = fit_curve_array(quadratic, 0, 10)

plot_data_with_fit(data, output)

print(data)


# array = two_column_text_read("volumes_energies.dat")
#
# print(fit_curve_array(quadratic_fit(array), 0, 10))
#
# print(bivariate_statistics(array))

# A = np.ones((3, 3))
#
#
# A, B = lowest_eigenvector(A)
# print(B)
# print(B[:, 0])
# print(A)