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

