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
    a = []
    y_max_abs = 0

    for key in gasses.keys():
        m = float(gasses[key]) * 6.0221409e-26
        v_rms = root_mean(m)

        for v in values:
            a.append(distribution_value(m, v))

        plt.plot(values, a, label=key+":"+" "+"v_rms = "+str(round(v_rms, 1)))
        y_min, y_max = plt.ylim()
        y_max_abs = max(y_max, y_max_abs)

        plt.plot([v_rms, v_rms], [0, distribution_value(m, v_rms)], 'r--', linewidth=.4)
        a = []

    plt.xlabel("Velocity (m/s)")
    plt.ylabel("Probability")
    plt.title("Maxwell-Boltzmann Distribution")
    plt.legend()
    plt.show()


distribution_curve(extract_data("Gas_mass.csv"))
