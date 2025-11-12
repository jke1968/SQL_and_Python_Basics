# Auffällig: 
# 1. keine Semikolons ;
# 2. keine Funktionsdefinitionen
# 3. keine Klassen

# Rufe die built-in function 'print' auf
# das Argument für die print Funktion ist 
# die String-Konstante 'Hello World!'
print('Grüß Dich Welt!')
# auch möglich: mit doppelten ""
print("Grüß Dich Welt!")
# mehrzeilige String Konstante
print(
    '''
    Hello 
    World
    !
    '''
)
# mehrere Strings für print:
# default Trennzeichen: ' '
print('Hello','World','!')
# trenne mit '/'
print('Hello','World','!',sep='/')
# print ohne Zeilenumbruch
print("Hello World !",end='')
print("Hello World !")
