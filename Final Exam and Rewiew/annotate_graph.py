
def annotate_graph(file_name_string, modulus):
    import matplotlib.pyplot as plt


    plt.annotate("Created by Michael Luccas 2020-05-12",
                 xy=(10, 10), xycoords='figure pixels')
    plt.annotate(file_name_string[0],
                 xy=(120, 380), xycoords='figure pixels')
    plt.annotate(file_name_string[1],
                 xy=(340, 100), xycoords='figure pixels')
    plt.annotate("$K_0$ ="+str(round(modulus, 3)),
                 xy=(340, 115), xycoords='figure pixels')
    plt.annotate("Birch-Murnaghan Equation of State for "+file_name_string[0]+" in DFT "+file_name_string[2],
                xy=(130, 460),
                xycoords='figure pixels'
                )


