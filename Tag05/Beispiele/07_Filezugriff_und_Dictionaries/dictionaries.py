class Person:
    def __init__(self,nr=0,name='N.A.'):
        self.nr = nr
        self.name = name
    def __str__(self):
        return f'Person Nr: {self.nr}, Name: {self.name}'
# Zur Erinnernung
# [] -> list
# () -> tuple
# {} -> dictionary
# dictionaries speichern key-value Paare
# definiere ein leeres dictionary
persons = {}
# key ist die Nummer, value ist das Komplettte Person-Objekt
p1 = Person(101,"van Rossum")
p2 = Person(100,"Codd")
p3 = Person(102,"Ritchie")
# speichere Personen-Objekte im dictionary
persons[p1.nr] = p1
persons[p2.nr] = p2
persons[p3.nr] = p3
# suche nach der Person mit nr = 100 im dictionary
person = persons.get(125)
if(person!=None):
    print(f'found: {person}')
else:
    print('no person found')