def berechneIdealgewicht(groesse, geschlecht):
    if (groesse<160):
        return None
    if(not geschlecht in ('m','w')):
        return None
    match geschlecht:
        case 'm':
            return groesse - 100
        case 'w':
            return (groesse - 100) * 0.8

def dollarToEuro(dollar):
    return dollar * 0.86

def displayMenu():
    print('Was wollen Sie tun?')
    print('1 - Das Idealgewicht berechnen')
    print('2 - Dollar in Euro umrechnen')
    print('3 - Programm beenden')
    choice = input()
    return choice

while(True):
    choice = displayMenu()
    match choice:
        case '1':
            string = input("Groesse in cm: ")
            groesse = int(string)
            geschlecht = input('Geschlecht (m/w): ')
            idealgewicht = berechneIdealgewicht(groesse,geschlecht)
            if(idealgewicht!=None):
                print(f'Idealgewicht: {idealgewicht}')
            else:
                print('Idealgewicht konnte nicht berechnet werden')
        case '2':
            dollar = float(input('Dollarbetrag: '))
            euro = dollarToEuro(dollar)
            print(f'{dollar} Dollar entsprechen {euro} Euro')
        case '3':
            break

print('End of program')
