import math as mt
def fx (aled):
    fx = 3*mt.pow(aled,3)+2*mt.pow(aled,2)-aled-3
    return fx

def Dichotomie(a,b,iterration):
    x1 = a
    x2 = b
    m=0
    for i in range (iterration):
        m = (x1+x2)/2
        if fx(x1) and fx(m) < 0:
            x2 = m
        else:
            x1 = m
    return m

print("Calcul avec la méthode de Dichotomie : ", Dichotomie(0,2,10))

def Secante(a,b,iterration):
    x1 = a
    x2 = b
    for i in range (iterration):
        pt_suiv = x2-fx(x2)*((x2-x1)/(fx(x2)-fx(x1)))
        x1 = x2
        x2 = pt_suiv
    return x2

print("Calcul avec la méthode de Sécante : ", Secante(0,2,10))

def fprime(x):
    return 9 * mt.pow(x, 2) + 4 * x - 1

def newton (x, iterations):
    derive = 0
    pt_suiv = 0
    for i in range (iterations):
        derive = fprime(x)
        pt_suiv = x - (fx(x) / derive)
        x = pt_suiv
    return x

print("Calcul avec la méthode de Newton : ", newton(2,4))