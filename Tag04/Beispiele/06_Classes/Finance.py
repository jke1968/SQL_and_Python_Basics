# Definition eines eigenen Datentyps namens "Konto" als Klasse
class Konto:
    # dunder method __init__ -> der Konstruktor der Klasse Konto
    def __init__(self,nr=0,saldo=0.0):
        print('default constructor of class Konto called') 
        # mit diesen Zuweisungen werden zwei 
        # private (wg. __) Attribute der Klasse Konto
        # definiert
        self.__nr = nr
        self.__saldo = saldo

    