# mit tupeln können Funktion erstellt werden,
# die mehrere Rückagebwerte haben
def return_x_y_coordinates():
    x = 4
    y = 11
    return x,y 

def modify_tuple(coordinates):
    # im Gegensatz zu lists sind
    # tuple sind read-only Objekte
    # besser: immutable objects
    # -> also führt folgendes zu einen Laufzeit-Fehler
    # coordinates[0] = 1  
    # coordinates[1] = 1  
    # 
    new_coordinates = (coordinates[0]-1,coordinates[1]-1)
    print(f'in function: {new_coordinates}')

# definiere ein tuple
# ein tuple ist eine Variable, die mehrere Felder/Elemente enthält
# vgl. mit einer struct in C/C++ 

# leeres tuple
tuple = () 
# tuple mit einem element
tuple = (1,)
# tuple mit mehreren elementen
tuple = 1,2,3
# tuple mit verschiedenen Element-Typen
# str, int, float
tuple = "ALPHA",1,1.2
# rufe Funktion, die ein tuple zurückgibt:
coordinates = return_x_y_coordinates()
print(f'coordinates: {coordinates}')
# rufe Funktion, die ein tuple zurückgibt:
# und zerlege das Tupel in seine Bestandteile:
x,y = return_x_y_coordinates()
print(f'x=: {x} y={y}')
modify_tuple(coordinates)
print(f'after function: {coordinates}')# rufe Funktion, die ein tuple zurückgibt:

