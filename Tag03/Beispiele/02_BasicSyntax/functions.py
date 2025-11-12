# Definition der Funktion add:
def add(number1, number2):
    '''function accepting 2 parameters and returning a result'''
    return number1 + number2
def divide(number1,number2):
    if number2 != 0:
        return number1 / number2
    else:
        return None # auffällig: None ist ein gültiger Wert für alle 
                    # Datentypen in Python

def printResult(result):
    '''function accepting one parameter and returning nothing (-> None)'''
    print( '*****')
    print(f'* {result} *')
    print( '*****')
    return None

# Aufruf der Funktion add
# mit zwei Argumenten vom Typ int
# deswegen ist result hier auch vom Typ int
result = add(1,2)
printResult(result)
result = divide(1,0)
if result != None:
    printResult(result)
else:
    print("No result avalaible")

# auffällig: da 
result = add(1)

print('end of program')


