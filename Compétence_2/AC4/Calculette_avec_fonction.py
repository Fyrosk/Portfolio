i=int
nombre1=int
nombre2=int
operateur=str

print("")
print("Calculette : saisir deux nombre séparées par un operateur pour obtenir le résultat.")
print("")
print("Les operateur reconnus sont : +(addition), - (soustraction), / (division réelle), d (division entière), p (puissance) et s (sortir du programme sans prendre en compte  les 2 nombres).")
print("")
operateur=str(input("Veuilliez mettre votre opérateur"))
print("")

while operateur !="s":
    def adition(nombre1:int,nombre2:int) ->int:
        return(nombre1+nombre2)

    def soustraction(nombre1:int,nombre2:int) ->int:
        return(nombre1-nombre2)

    def division_réel(nombre1:int,nombre2:int) ->int:
        return(nombre1/nombre2)

    def division_entière(nombre1:int,nombre2:int) ->int:
        return(nombre1//nombre2)

    def puissance(nombre1:int) ->int:
        return(nombre1*nombre1)

    if operateur=="+":
        nombre1=int(input("Veuilliez mettre un chiffre"))
        print("")
        nombre2=int(input("Veuilliez mettre un chiffre"))
        print("résultat :",adition(nombre1,nombre2))

    elif operateur =="-":
        nombre1=int(input("Veuilliez mettre un chiffre"))
        print("")
        nombre2=int(input("Veuilliez mettre un chiffre"))
        print("résulta :",soustraction(nombre1,nombre2))

    elif operateur =="/":
        nombre1=int(input("Veuilliez mettre un chiffre"))
        print("")
        nombre2=int(input("Veuilliez mettre un chiffre"))
        print("résulta :",division_réel(nombre1,nombre2))
    
    elif operateur =="d":
        nombre1=int(input("Veuilliez mettre un chiffre"))
        print("")
        nombre2=int(input("Veuilliez mettre un chiffre"))
        print("résulta :",division_entière(nombre1,nombre2))

    elif operateur == "p":
        nombre1=int(input("Veuilliez mettre un chiffre"))
        print("résulta :",puissance(nombre1))

    print("")
    print("Calculette : saisir deux nombre séparées par un operateur pour obtenir le résultat.")
    print("")
    print("Les operateur reconnus sont : +(addition), - (soustraction), / (division réelle), d (division entière), p (puissance) et s (sortir du programme sans prendre en compte  les 2 nombres).")
    print("")
    operateur=str(input("Veuilliez mettre votre opérateur"))

if operateur=="s":
    print("Sortie de la calculatrice")