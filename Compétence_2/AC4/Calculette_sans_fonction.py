i=int
nombre1=int
nombre2=int
puissance=int
operateur=str

print("")
print("Calculette : saisir deux nombre séparées par un operateur pour obtenir le résultat.")
print("")
print("Les operateur reconnus sont : +(addition), - (soustraction), * (multiplication), / (division réelle), d (division entière), p (puissance) et s (sortir du programme sans prendre en compte  les 2 nombres).")
print("")
operateur=str(input("Veuilliez mettre votre opérateur : "))
print("")

while operateur !="s":
    if operateur=="+":
        nombre1=int(input("Veuilliez mettre un chiffre : "))
        print("")
        nombre2=int(input("Veuilliez mettre un chiffre : "))
        calcul=nombre1+nombre2
        print(calcul)

    elif operateur =="-":
        nombre1=int(input("Veuilliez mettre un chiffre : "))
        print("")
        nombre2=int(input("Veuilliez mettre un chiffre : "))
        calcul=nombre1-nombre2
        print(calcul)

    elif operateur =="*":
        nombre1=int(input("Veuilliez mettre un chiffre : "))
        print("")
        nombre2=int(input("Veuilliez mettre un chiffre : "))
        calcul=nombre1*nombre2
        print(calcul)

    elif operateur =="/":
        if nombre2 !=0:
            nombre1=int(input("Veuilliez mettre un chiffre : "))
            print("")
            nombre2=int(input("Veuilliez mettre un diviseur autre que 0 : "))
            calcul=nombre1/nombre2
            print(calcul)
        else:
            print("Veuilliez mettre un autre diviseur que 0")
    
    elif operateur =="d":
            nombre1=int(input("Veuilliez mettre un chiffre : "))
            print("")
            nombre2=int(input("Veuilliez mettre un diviseur autre que 0 : "))
            calcul=nombre1/nombre2
            calculr=nombre1%nombre2
            print("quotien : ",calcul)
            print("reste : ",calculr)

    elif operateur == "p":
            nombre1=int(input("Veuilliez mettre un chiffre : "))
            puissance=int(input("Veuilliez mettre votre puissance : "))
            calcul=nombre1**puissance
            print(calcul)

    print("")
    print("Calculette : saisir deux nombre séparées par un operateur pour obtenir le résultat.")
    print("")
    print("Les operateur reconnus sont : +(addition), - (soustraction), / (division réelle), d (division entière), p (puissance) et s (sortir du programme sans prendre en compte  les 2 nombres).")
    print("")
    operateur=str(input("Veuilliez mettre votre opérateur : "))

if operateur=="s":
    print("Sortie de la calculatrice")