# auffällig:
# Variablen in Python können ohne Angabe eines Datentyps
# definiert werden:
# Hinweis: die built-in input liefert einen String ('str') zurück,
# also(!) ist number ein String 
string = input('Bitte Zahl eingeben: ')
# String-Konstanten, die mit f beginnen,
# heissen: "formatted strings"
print(f'Ihre Eingabe war: {string}')
# auffällig: keine {} zur Kennzeichnung
# des scopes, sondern Einrückungen
try:
    # konvertiere den String in einen int-Wert:
    # int gibt einen integer-Wert zurück,
    # also ist number vom Typ integer
    # falls 'string' nicht in einen int-Wert
    # konvertiert werden kann, wird ein Error erzeugt,
    # und an die Stelle nach "except" verzweigt
    number = int(string)

    # erhöhe number um 1 
    number = number + 1
    print(f'Number + 1 = {number}')
except:
    print('Bitte nur Zahlen eingeben')