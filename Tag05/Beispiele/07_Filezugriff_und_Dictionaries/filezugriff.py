# write three lines to a file and read them back
# öffne Textfile namens 'example.txt' zum Schreiben ('w')
# wenn das File nicht existiert, dann wird es erzeugt
with open('example.txt', 'w') as file:
    file.write('ALPHA;EPSILON;GAMMA\n')
    file.write('ALPHA;BETA;GAMMA\n')
    file.write('ALPHA;BETA;EPSILON\n')

# wie oben, aber zum Lesen ('r'):
with open('example.txt', 'r') as file:
    lines = file.readlines()
    for line in lines:
        # strip() entfernt den Umbruch am Ende des Strings
        # split() trennt den String anhand eines Trennzeichens (hier: ';')
        for column in line.strip().split(';'):
            print(f'  {column}')
        print('-----')

    for line in lines:
        cols = line.strip().split(';')
        # Ausgabe jeder column in einem 10-stelligen Bereich der Konsole
        # -> alle Spalten sind linksbündig untereinander angeordnet:
        print(f'{cols[0]:<10} {cols[1]:<10} {cols[2]:10}')