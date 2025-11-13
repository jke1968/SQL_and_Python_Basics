# Übung 03 lists and tuples

def add_product(products):
    number = input("Nummer: ")
    name = input("Name: ")
    try:
        net_price = float(input("Preis: "))
    except ValueError:
        print("Ungültiger Preis")
        return
    products.append((number, name, net_price))
    print("Produkt hinzugefügt\n")


def list_products(products):
    if not products:
        print("Keine Produkte vorhanden\n")
        return
    print("\nAlle Produkte:")
    print("-" * 40)
    for p in products:
        print(p)
    print("-" * 40 + "\n")


def find_product(products):
    nummer = input("Nummer: ")
    for p in products:
        if p[0] == nummer:
            print(f'Gefunden: {p}')
            break

def sort_products(products):
    # sort by first element of tuple:
    products.sort(key=lambda tup: tup[0])
    print("Produkte nach Nummer sortiert\n")


def main():
    products = []
    while True:
        print("Produktkatalog")
        print("1. Produkt hinzufügen")
        print("2. Alle Produkte ausgeben")
        print("3. Produkt suchen")
        print("4. Produkte nach Nummer sortieren")
        print("5. Programm beenden")
        choice = input("Ihre Auswahl: ")

        if choice == "1":
            add_product(products)
        elif choice == "2":
            list_products(products)
        elif choice == "3":
            find_product(products)
        elif choice == "4":
            sort_products(products)
        elif choice == "5":
            print("Auf Wiedersehen")
            break
        else:
            print("Ungueltige Eingabe\n")


if __name__ == "__main__":
    main()
