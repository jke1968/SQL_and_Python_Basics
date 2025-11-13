# importiere die Klasse "Konto"
# aus dem Module "Finance"
from Finance import Konto

def main():
    print(f'main called in module {__name__}')
    # erzeuge ein Objekt der Klasse Konto
    k = Konto()
    print(k)
    # Zugriff auf private member der Klasse Account
    # lesender Zugriff -> Laufzeitfehler
    # print(f'vorher: k.__nr = {k.__nr}')
    # schreibender Zugriff: erzeugt ein neues Attribut
    # zur Laufzeit!
    k.__nr = 100
    print(f'nachher: k.__nr = {k.__nr}')


if __name__ == '__main__':
    main()