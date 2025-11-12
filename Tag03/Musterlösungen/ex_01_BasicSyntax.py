import sys

input_1 = input('lower bound: ')
input_2 = input('upper bound: ')
try:
    lowerBound = int(input_1)
    upperBound = int(input_2)
except:
    print('Bitte nur Zahlen eingeben')
    sys.exit(1)
#1 
counter = lowerBound
while counter <= upperBound:
    print(f'{counter }',end=' ')
    counter = counter+1
print()

#2 
counter = upperBound
while counter >= lowerBound:
    print(f'{counter }',end=' ')
    counter = counter-1
print()

#3 
counter = lowerBound
while counter <= upperBound:
    if counter % 2 ==0:
        print(f'{counter }',end=' ')    
    counter = counter+1
print()

#4 
counter = lowerBound
sum = 0
while counter <= upperBound:
    sum = sum + counter
    counter = counter+1
print(f'summe aller Zahlen zwischen {lowerBound} und {upperBound} = {sum}')

#5 
counter = lowerBound
sum = 0
while counter <= upperBound:
    if counter % 2 == 1:
        sum = sum + counter
    counter = counter+1
print(f'summe aller ungeraden Zahlen zwischen {lowerBound} und {upperBound} = {sum}')

#6
counter = lowerBound
sum = 0
evencounter = 0
while counter <= upperBound:
    if counter % 2 == 0:
        sum = sum + counter
        evencounter = evencounter + 1
    counter = counter+1
avg = sum / evencounter
print(f'durchschnitt aller geraden Zahlen zwischen {lowerBound} und {upperBound} = {avg}')

