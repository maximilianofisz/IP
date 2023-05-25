import math
# Ej 1
#1.
def raizDe2() -> float:
    return round(2**0.5,4)
#2.
def imprimir_hola():
    print("hola")

#3.
def imprimir_un_verso():
    print("Que buen dato me tiraste mi amigo\npero no recuerdo haberte preguntado")

#4.
def factorial_2() -> int:
    return 2

#5.
def factorial_3() -> int:
    return 6

#6.
def factorial_4() -> int:
    return 24

#7.
def factorial_5() -> int: 
    return 120

# Ej 2
#1.
def imprimir_saludo(nombre: str) -> str:
    return (f"Hola {nombre}")

#2.
def raiz_cuadrada(numero: int) -> float:
    return round(numero**0.5)

#3.
def imprimir_dos_veces(estribillo: str) -> float:
    return (estribillo * 2)

#4.
def es_multiplo_de(n: int, m: int) -> bool:
    return (n % m == 0)

#5.
def es_par(numero: int) -> bool:
    return es_multiplo_de(numero,2)

#6.
def cantidad_de_pizzas(comensales: int, min_cant_de_porciones: int) -> int:
    return math.ceil((comensales*min_cant_de_porciones)/8)

#Ej 3
#1.
def alguno_es_0(numero1: int, numero2: int) -> bool:
    return numero1 == 0 or numero2 == 0

#2.
def ambos_son_0(numero1: int, numero2: int) -> bool:
    return numero1 == 0 and numero2 == 0

#3. 
def es_nombre_largo(nombre: str) -> bool:
    return len(nombre) >= 3 or len(nombre) <= 8

#4.
def es_bisiesto(año: int) -> bool:
    return es_multiplo_de(año,400) or (es_multiplo_de(año,4) and not(es_multiplo_de(año,100)))

#Ej 4
#1.
def peso_pino(altura: int) -> int:
    if(altura <= 300):
        return altura * 3
    else:
        return (altura-300)*2 + (300*3)

#2.
def es_peso_util(peso: int) -> bool:
    return peso > 399 and peso < 1001

#3.
def sirve_pino(altura: int) -> bool:
    return es_peso_util(peso_pino(altura))

#Ej 5
#1.
def devolver_el_doble_si_es_par(numero:int) -> int:
    if(es_multiplo_de(numero,2)):
        return numero*2
    else:
        return numero


#2.
def devolver_valor_si_es_par_sino_el_que_sigue(numero:int) -> int:
    if(es_multiplo_de(numero,2)):
        return numero
    else:
        return numero+1

#3.
def devolver_el_doble_si_es_multiplo3_el_triple_si_es_multiplo9(numero:int) -> int:
    if(es_multiplo_de(numero, 9)):
        return numero*3
    elif(es_multiplo_de(numero, 3)):
        return numero*2
    else:
        return numero

#4.
def juzgador_de_nombre(nombre:str) -> str:
    if(len(nombre) >= 5):
        return "Tu nombre tiene muchas letras"
    else:
        return "Tu nombre tiene menos de 5 letras"

#5.
def dios_santo(sexo:str,edad:int) -> str:
    if(edad < 18):
        return "playa playa con las chicas en malla"
    elif(sexo == "f" and edad > 59):
        return "playa moment"
    elif(sexo == "m" and edad > 64):
        return "playitaaaa"
    else:
        return "palitaaaaaaaaaaaa"

#Ej 6
#1.
def uno_al_diez():
    n:int = 1
    while(n<11):
        print(n)
        n+=1

#2.
def pares_10_40():
    n:int = 10
    while(n<41):
        if(es_multiplo_de(n,2)):
            print(n)
            n+=1
        else:
            n+=1

#3.
def ecos():
    n:int = 0
    while(n<10):
        print("eco")
        n+=1

#4.
def cohete(numero:int):
    while(numero>0):
        print(numero)
        numero-=1
    print("Despegue")

#5.
def delorean(partida:int, llegada:int):
    while(partida>llegada):
        partida-=1
        print(f"Viajo un año al pasado, estamos en el año {partida}")


def delorean_ls_swapped(partida:int, llegada:int):
    while(partida>llegada):
        partida-=20
        print(f"Viajo un año al pasado, estamos en el año {partida}")


#Ej 7
#1.
def for_1_al_10():
    for num in range(1,11):
        print(num)

#2.
def for_pares_1_al_40():
    for num in range(10,41,2):
        print(num)

#3.
def for_ecos():
    for num in range(0,10):
        print("eco")

#4.
def for_cohete(numero:int):
    for num in reversed(range(1,numero+1)):
        print(num)
    print("Despegue")

#5.
def for_delorean(partida:int, llegada:int):
    for num in reversed(range(llegada,partida)):
        print(f"Viajo un año al pasado, estamos en el año {num}")

#6.
def for_delorean_ls_swapped(partida:int):
    for num in reversed(range(-384,partida,20)):
        print(f"Viajo un año al pasado, estamos en el año {num}")

