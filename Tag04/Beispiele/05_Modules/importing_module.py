import imported_module
# from imported_module import f
# from imported_module import *

def main():
    print('call function f from imported module')
    value = imported_module.f()
    print(f'value = {value}')
    
# ist dieses File das "main" module?
# namen, die mit '__' anfangen, sind spezielle Namen der Sprache Python
# "dunder names", häufiger: "dunder methods" ("dunder"= "double underscore")
if __name__ == 'main':
    # rufe die main-Funktion
    main()


