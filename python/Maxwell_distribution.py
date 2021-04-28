""" 
This program is designed to take a user input of Kelvin temperature. Data relating to molecular gasses will be
extracted from a file. Calculations will return probability functions for the velocities of gas particles at the
given temperature. Computations to output a graphical representation of these functions will occur and the results
 will be displayed.
"""

import matplotlib.pyplot as plt
import numpy as np
t = float(input("Please enter a Kelvin temperature: "))
k = 1.38064852e-23


def extract_data(file_name):
    gasses = {}
    file = open(file_name)
    content = file.readlines()

    for line in content:
        elements = line.split(",")
        gas = elements[0]
        mass = elements[1]
        gasses[gas] = mass
    return gasses

def root_mean(gas_mass):
    fact = np.sqrt(k * t / gas_mass)
    v_rms = np.sqrt(3) * fact

    return v_rms


def distribution_value(mass, velocity):
    fact = (4 * np.pi) * (mass / (2 * np.pi * k * t)) ** (3 / 2)
    return fact * velocity ** 2 / np.exp((mass * (velocity ** 2)) / (2 * k * t))


def distribution_curve(gasses):
    values = list(range(0, 800, 3))
    print(values)
    a = []
    ymax_abs = 0

    for key in gasses.keys():
        m = float(gasses[key]) * 6.0221409e-26
        v_rms = root_mean(m)
        print(v_rms)
        print(distribution_value(m, v_rms))
        for v in values:
            a.append(distribution_value(m, v))

        plt.plot(values, a)
        ymin, ymax = plt.ylim()
        ymax_abs = max(ymax, ymax_abs)
        #plt.ylim(bottom=0, top=1.1*np.amax(a))
        #plt.axvline(v_rms, ymin=0, ymax=distrobution_value(m, v_rms)/ymax_abs)

        plt.plot([v_rms, v_rms], [0, distribution_value(m, v_rms)])
        print(a)
        a = []

    plt.show()


distribution_curve(extract_data("Gas_mass.csv"))


# distribution_curve(extract_data("Gas_mass.csv"))
# function [v_max, v_rms, v_ave] = velocities(T, m)
#     k = 1.38064852e-23;
#     fact = sqrt(k*T / m);
#     v_max = sqrt(2) * fact;
#     v_rms = sqrt(3) * fact;
#     v_ave = sqrt(8 / pi) * fact;
# end

#print(extract_data("Gas_mass.csv"))

# 4. if __name__ == "__main__" block, which calls a primary function with a clear name 

# All code is inside function definitions for simulation solution & visualization (functional programming)
#	Each function contains a docstring compliant with PEP 257: https://www.python.org/dev/peps/pep-0257/
#	Module ends with if __name__ == "__main__" block to execute central function of the code

# Primary simulation function structure
#	1. Module imports
#		Use SciPy constants for physical constants in particular function (not globally)
#			https://docs.scipy.org/doc/scipy/reference/constants.html
#		Follow best practice order: 
#			https://docs.python.org/3/faq/programming.html#what-are-the-best-practices-for-using-import-in-a-module
# 	2. Simulation parameters
#		Each parameter named clearly and units marked in in-line comment
#		Naming of all variables should comply with PEP 8: 
#			https://www.python.org/dev/peps/pep-0008/#documentation-strings
#			(lower_case_with_underscores)
# 	3. Computed parameters (from simulation parameters)
# 	4. Function calls (use PEP 8-compliant lower_case_with_underscores) and simple calculations for:
#		data read-in
#		simulation solution 
#		visualization
