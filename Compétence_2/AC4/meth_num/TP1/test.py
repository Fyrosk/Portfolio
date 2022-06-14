from math import sqrt

from numpy import indices
def suite_U(n):
    if n==0:
        return 0
    else:
        return(1/sqrt(suite_U(n-1)+3))
n=10
print(suite_U(n))
print("\n")
#-----------------------------------------------
print("2.2")
def carre_median(nombre, iterration):
    for i in range (iterration):
        nombre = ((nombre*nombre)//100)%10000
    return nombre
        
nombre = 1234
itt = 50
print(carre_median(nombre, itt))
print("\n")

#---------------------------------------------------
print("2.3")
triplet = {'a' : 11, 'b' : 29, 'm' : 96}
def alea (iterration):
    if iterration == 0:
        return 1
    else:
        return (triplet['a'] * alea(iterration-1) + triplet['b']) % triplet['m']

print(alea(10))
print("\n")
#----------------------------------------------
triplet = {'a' : 75, 'b' : 0, 'm' : 2**31 -1}
def alea_park_miller (iterration):
    if iterration == 0:
        return 1
    else:
        return (triplet['a'] * alea_park_miller(iterration-1) + triplet['b']) % triplet['m']

print(alea(10))
print("\n")
#--------------------------------------------------
print("2.4")
triplet = {'a' : 75, 'b' : 0, 'm' : 2**31 -1}
def alea_date (iterration):
    if iterration == 0:
        return int(current_time.strftime('%S'))
    else:
        return (triplet['a'] * alea_date(iterration-1) + triplet['b']) % triplet['m']

import datetime
current_time = datetime.datetime.now()
print (current_time.strftime("%H:%M:%S %d/%m/%Y "))
min=int(current_time.strftime('%M'))
print(alea_date(10))
print("\n")

print("3")

terme_depart = {0:1, 1:2, 2:0, 3:7}
triplet_congruence = {'a' : 5, 'b' : 5, 'n' : 32, 'r' : 4}
def congruence(iterration):
    if iterration < 4:
        return terme_depart[iterration]
    else:
        return (triplet_congruence['a'] * congruence(iterration-triplet_congruence['r']) + triplet_congruence['b']) % triplet_congruence['n']
    
print(congruence(5))
        
