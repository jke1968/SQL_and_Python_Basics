def print_list(list):
    # verwende die print Funktion für eine default Ausgabe von lists
    print(list)
    # verwende eine for-Schleife 
    for element in list:
        print(element)
# Objekte vom Typ list werden "by-reference" übergeben,
# ihre Inhalte werden also nicht kopiert
def modify_list(list):
    # ändere erstes listenelement
    list[0] = 0
    # füge Element am Ende der Liste hinzu 
    list.append(4)
    # füge eine Liste zu einer Liste hinzu
    list += [-7,-8,-9]
def slicing_lists():
    strings = ["ZERO","ONE","TWO","THREE","FOUR"]
    # ? 
    print(f'Alle Elemente [:] {strings[:]}')    
    print(f'Alle Elemente [::] {strings[::]}')    
    print(f'Die Elemente 2 bis 3 [2:4] {strings[2:4]}')    
    print(f'Die Elemente 2 bis 3 [4:2:-1] umgekehrt {strings[4:2:-1]}')    
    print(f'Die ersten 2 Elemente  {strings[:2]}')    
    print(f'Die letzten 2 Elemente  {strings[-2:]}')    
    print(f'Alle Elemente umgekehrt [::-1] {strings[::-1]}')    
    

# numbers ist vom Typ 'list',
# weil der Ausdruck [1,2,3] vom Typ list ist
numbers = [1,2,3]
print_list(numbers)
modify_list(numbers)
print('nach modify:')
print(f'Die Liste {numbers} hat {len(numbers)} Elemente')
print_list(numbers)
# sortiere eine Liste:
# -> rufe die sort() für das Objekt 'numbers' auf:
numbers.sort()
print('nach Sortierung:')
print_list(numbers)
# die Elemente einer Python list müssen nicht
# alle vom selben Datentyp sein:
numbers[3] = 'X'
print_list(numbers)
print('Sortiere mit verschiedenen Elementtypen')
# sort() erzeugt einen Laufzeitfehler, wenn veschiedene
# Elementtypen in der list sind:
# numbers.sort()
slicing_lists()










