
def visualize_vectors_in_space(potential, dimensions, parameter, display):
    import numpy as np
    import matplotlib.pyplot as plt
    from generate_matrix import generate_matrix
    from lowest_eigenvector import lowest_eigenvector

    # potential = 'square'
    # dimensions = 130
    # parameter = 200
    legend = []
    x = np.linspace(-10, 10, dimensions)
    matrix = generate_matrix(-10., 10., dimensions, potential, parameter)
    eigenvalues, eigenvectors = lowest_eigenvector(matrix, 3)

    for n in range(1, 4):

        plt.plot(x, eigenvectors[n])

    plt.xlabel("x [a.u.]")
    plt.ylabel("$ψ_n(x)$  [a.u.]")
    plt.annotate("Created by Michael Luccas 2020-05-12",
                 xy=(10, 10),
                 xycoords='figure pixels'
                 )
    plt.annotate("Select Wavefunctions for a Square Potential on a Spatial Grid of 130 Points" ,
                 xy=(68, 460),
                 xycoords='figure pixels'
                 )
    plt.savefig("Luccas.square.Eigenvector1,2,3.png")

    if display is True:
        plt.show()
    else:
        plt.savefig("Luccas.square.Eigenvector1,2,3.png")


visualize_vectors_in_space("square", 130, 200, False)