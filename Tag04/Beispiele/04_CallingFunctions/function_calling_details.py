# Funktion mit default-Parameterwerten
def create_product_tuple(nr=0,name='N.A.',preis=0.0):
    return nr,name,preis

def call_function_with_defaults():
    product = create_product_tuple(100,'Banane',0.99)
    print(product)
    # wenn nicht alle Argumente bekannt sind,
    # kann nur ein Teil von ihnen übergeben werden
    product = create_product_tuple(name='USB-Stick') 
    print(product)

def get_second_element(tupel):
    return tupel[1]
def get_third_element(tupel):
    return tupel[2]


numbers = [2,3,1]
numbers.sort()
print(f'numbers sorted {numbers}')

# ein Liste, bestehend aus 2 Tupeln mit jeweils 3 Elementen
elements = [(100,'USB-Stick',19.99),(101,'Banane',0.99)]
print(elements)
# sortiere die Liste nach dem 2. Element der Tupel
print('try to sort elements....')
# rufe sort mit einer Funktion auf, die bestimmt,
# nach welchem Tupel-Element sortiert werden soll
elements.sort(key=get_second_element)
print('elements sorted by "name" ')
print(elements)

elements.sort(key=get_third_element)
print('elements sorted by "price" ')
print(elements)

# sort kann auch mit einer sog. "lambda expression"
# anstelle eines Funktionsnamens aufgerufen werden
# z.B: so (sortiere nach der "Nummer", also nach dem ersten Element im Tupel)
elements.sort(key= lambda tupel : tupel[0])
print('elements sorted by "nummer" ')
print(elements)
