#from mpl_toolkits.mplot3d import Axes3D

#import matplotlib.pyplot as plt
#import numpy as np

file = open("data.txt", 'r')

for object in file:
    print(object)

# def load_in_array(file_name):
#
#   file = open(file_name)
#   content = file.readlines()[-5:]
#   epsilon = []
#   exact_error = []
#   n = []
#   temp_epsilon = []
#   temp_exact = []
#   temp_n = []
#
#   for line in content:
#     elements = line.split(",")
#     temp_epsilon.append(elements[0])
#     temp_exact.append(elements[1])
#     temp_n.append(elements[2])
#
#   for obj in temp_epsilon:
#     element = obj.split()
#     epsilon.append(float(element[1])
#
#   for obj in temp_exact:
#     element = obj.split()
#     exact_error.append(float(element[1])
#
#   for obj in temp_n:
#     element = obj.split("=")
#     n.append(float(element[1])
#
#
#   print(epsilon)
#   print(exact_error)
#   print(n)
#   print(n[0].split("="))


from mpl_toolkits.mplot3d import Axes3D

