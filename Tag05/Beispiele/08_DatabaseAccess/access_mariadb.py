# installiere maraidb connector via:
# pip install mariadb
import mariadb

def print_all_lines_tbuch(cursor):
    # sql statements werden als strings erstellt:
    sqlstatement = 'select * from tbuch'
    cursor.execute(sqlstatement)
    # Schleife über alle Zeilen, die das select-Statement
    # aus der DB erhalten hat: -> Methode fetchall()
    for buchnr,erschj,preis,verlagnr,titel in cursor.fetchall():
        print(f'{buchnr:<3} {str(erschj):<4} {str(preis):<5} {str(verlagnr):<4} {titel:<20}') 

print('try to connect to mariadb server...')
try:
    connection = mariadb.connect (
        host='localhost',
        user='root',
        password='root',
        port=3306,
        database='books'
    )
    print('connected to mariadb server')
    # über das 'cursor' Objekt wird mit der Datenbank
    # kommuniziert
    cursor = connection.cursor()
    print_all_lines_tbuch(cursor)
    # neue Zeile einfügen
    cursor.execute("INSERT INTO tbuch VALUES (99,2025,25.99,1111,'Signaltechnik')")
    print('one row inserted')
    print_all_lines_tbuch(cursor)
    cursor.execute('DELETE FROM tbuch WHERE buchnr = 99')
    print('one row deleted')
    print_all_lines_tbuch(cursor)
except mariadb.Error as e:
    print(f'Error while talking to mariadb: {e}')
    exit(1)

