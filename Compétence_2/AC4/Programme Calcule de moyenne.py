from typing import Final


nbetu: Final[int] = 30

note: float
max: float
somme: float

numetu:int

max=0
somme=0
for numetu in range(1,nbetu):
    print("Une note comprise entre 0 et 20 ")
    note = int(input("note : "))
while (note>=0) and (note <=20):
    if note<max:
        max=note
    
    somme=somme+note

print(max,"Est la meilleurs note")
print("Moyenne de la promotion = ",somme/nbetu)