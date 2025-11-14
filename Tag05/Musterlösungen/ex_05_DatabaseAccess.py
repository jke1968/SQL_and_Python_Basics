import mariadb
def connectToDatabase():
    print('try to connect to mariadb server...')
    try:
        connection = mariadb.connect (
            host='localhost',
            user='edgar',
            password='edgar',
            port=3306,
            database='auftragdb'
        )
        print('connected to mariadb server')
        cursor = connection.cursor()
        return cursor
    except mariadb.Error as e:
        print(f'Error while talking to mariadb: {e}')
        exit(1)

def showOrders():
    cursor = connectToDatabase()
    sqlstatement = 'SELECT nr,datum,kundennr FROM auftrag'
    try:
        cursor.execute(sqlstatement)
        print(f'{"Auftragnr":<10} {"Datum":<10} {"Kundennr" :<15}')    
        for nr, datum, kundennr in cursor.fetchall():
            print(f'{str(nr):<10} {str(datum):<10} {str(kundennr):<15}')    
    except mariadb.Error as e:
        print(f'Error while executing SQL statement: {e}')
    finally:  
        cursor.close() 

def createOrder():
    auftragnr = input('Bitte Auftragsnummer eingeben: ')
    datum = input('Bitte Datum eingeben (YYYY-MM-DD): ')
    kundennr = input('Bitte Kundennummer eingeben: ')
    cursor = connectToDatabase()
    sqlstatement = 'INSERT INTO auftrag (nr, datum, kundennr) VALUES (?, ?, ?)'
    try:
        cursor.execute(sqlstatement, (auftragnr, datum, kundennr))
        cursor.connection.commit()
        print('Auftrag erfolgreich erfasst.')       
    except mariadb.Error as e:
        print(f'Fehler beim Erfassen des Auftrags: {e}')
    finally:  
        cursor.close() 

def printMenu():
    while True:
        print('Was wollen Sie tun?')
        print('1 - Alle Aufträge anzeigen')
        print('2 - Einen Auftrag erfassen')
        print('3 - Programm beenden')
        choice = input()
        match(choice):
            case '1':
                print('Alle Aufträge anzeigen ausgewählt.')
                showOrders()
            case '2':
                print('Einen Auftrag erfassen ausgewählt.')
                createOrder()
            case '3':
                print('Programm wird beendet.')
                return
            case _:
                print('Ungültige Auswahl. Bitte erneut versuchen.')

if __name__ == '__main__':
    printMenu()