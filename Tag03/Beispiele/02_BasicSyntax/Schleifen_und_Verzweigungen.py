lowerBound = 1
upperBound = 10
counter = lowerBound
# klassische while Schleife:
while counter <= upperBound:
    print(f'{counter} ',end='') # end='' heisst: kein Zeilenumbruch
    counter = counter + 1   
print() # Schreibe einen Zeilenumbruch
counter = lowerBound
while counter <= upperBound:
    if counter%2==0:
        print(f'{counter} ',end='')
    else:
        print(' ',end='')
    counter = counter + 1
print()