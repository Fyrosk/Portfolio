import math as mt
import matplotlib.pyplot as plt
import numpy as np
def P(x):
    return (x-2)**2

valeurs_x=np.linspace(-2,10,70)
valeurs_y=[]
for i in valeurs_x:
    valeurs_y.append(P(i))
plt.plot(valeurs_x,valeurs_y)
plt.xlim(-2, 10)
plt.show()


def Fprime(x):
    return 2*(x-2)

def Min(debut, alpha, iterration):
    for i in range (iterration):
        debut = (debut) - alpha * Fprime(debut)
    return debut

print(Min(8,0.2,7))

import numpy as np
import matplotlib.pyplot as plt
def Tangente_succesive(debut, iterration):

    x = np.linspace(0, 3, 70)

    for i in range(iterration):
        y = Fprime(debut) * (x-debut) + (x-2)**2
        plt.plot(x, y)
        plt.pause(0.01) # pause avec duree en secondes

    plt.show()
    
Tangente_succesive(8,7)