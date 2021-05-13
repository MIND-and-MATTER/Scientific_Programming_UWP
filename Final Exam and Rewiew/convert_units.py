
def convert_units(value, unit_from, unit_to):
    import scipy.constants as sc
    rydberg_to_ev = sc.value("Rydberg constant times hc in eV")
    rydberg_to_joule = sc.value("Rydberg constant times hc in J")
    bohr_to_meter = sc.value("Bohr radius")

    if unit_from == "cubic bohr" and unit_to == "cubic angstrom":
        temp = value**(1/3)
        converted_value_volume = ((temp*bohr_to_meter)*10**10)**3
        return converted_value_volume

    elif unit_from == "rydberg" and unit_to == "ev":
        converted_value_energy = value * rydberg_to_ev
        return converted_value_energy

    elif unit_from == "rydberg per cubic bohr" and unit_to == "gigapascals":
        numerator = value * rydberg_to_joule
        denominator = bohr_to_meter**3
        converted_value_bulk_modulus = (value*numerator/denominator) * 10**-9
        return converted_value_bulk_modulus
    else:
        raise ImportError("Your inputs cannot be converted")












