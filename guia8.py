#Ej 1
#1.
def pertenece(elem:int, lista:[int]) -> bool:
    for i in range(len(lista)):
        if(lista[i]==elem):
            return True
    return False

#2.
def divideATodos(elem:int, lista:[int]) -> bool:
    for i in range(len(lista)):
        if(lista[i] % elem != 0):
import numpy
#2.
def sube():
    flag:bool = True
    history = []
    while(flag):
        for line in history:
            print(line[0] + " " + line[1])
        operation = input("C = Cargar; D = Descontar; X = Salir\n")
        if(operation == "C"):
            amount:int = input("Cuanto?\n")
            history.append(("C", amount))
        if(operation == "D"):
            amount:int = input("Cuanto?\n")
            history.append(("D", amount))
        if(operation == "X"):
            flag = False

# Ej 4
def pertenece(x:int,y:[int])->bool:
    for i in y:
        if x==i:
            return True
        else: 
            return False


#1.
def perteneceACadaUno(elem:int, seq:[[int]]) -> [bool]:
    response:[bool] = []
    for list in seq:
        if(pertenece(elem, list)):
            response.append(True)
        else:
            response.append(False)
    print(response)

#2.
def esMatriz(seq:[[int]]) -> bool:
    if(len(seq) == 0):
        return False
    if(len(seq[0]) == 0):
        return False
    size:int = len(seq[0])
    for list in seq:
        if(len(list) != size):
            return False
    return True

#3.
def sumaTotal(lista:[int]) -> int:
    sum:int = 0
    for i in range(len(lista)):
        sum = sum + lista[i]
    return sum

#4.
def ordenados(lista:[int]) -> bool:
    for i in range(len(lista)-1):
        if(lista[i]>lista[i+1]):
            return False
    return True

#5.
def long_sup_7(lista:[str]) -> bool:
    for i in range(len(lista)):
        if(len(lista[i]) > 7):
            return True
    return False

#6.
def palindromo(palabra:str) -> bool:
    listaA:[str] = list(palabra)
    listaB:[str] = list(reversed(palabra))

    for i in range(len(listaA)):
        if(listaA[i] != listaB[i]):
            return False
    return True

#7.
def tieneMinus(contra:str) -> bool:
    charArray:[str] = list(contra)
    for i in range(len(charArray)):
        if(charArray[i] != charArray[i].upper()):
            return True
    return False

def tieneMayus(contra:str) -> bool:
    charArray:[str] = list(contra)
    for i in range(len(charArray)):
        if(charArray[i] != charArray[i].lower()):
            return True
    return False

def tieneNumero(contra:str) -> bool:
    numeros:[str] = list("1234567890")
    charArray:[str] = list(contra)
    for i in range(len(charArray)):
        if(pertenece(charArray[i], numeros)):
            return True
    return False


def contraseña(contra:str) -> str:
    if(len(contra) < 5):
        return "ROJA"
    elif(len(contra) > 8 and tieneMinus(contra) and tieneMayus(contra) and tieneNumero(contra)):
        return "VERDE"
    else:
        return "AMARILLA"

#8.
def calculador_de_saldo(operaciones:[(str,int)]) -> int:
    saldo:int = 0
    for i in range(len(operaciones)):
        if(operaciones[i][0]=="I"):
            saldo = saldo + operaciones[i][1]
        else:
            saldo = saldo - operaciones[i][1]
    return saldo

#9.
def vocales_distintas(palabra:str) -> bool:
    contador:int = 0
    vocales:[str] = list("aAeEiIoOuU")
    palabraArray = list(palabra)
    for i in range(len(palabraArray)):
        if(pertenece(palabraArray[i],vocales)):
            contador += 1
    if(contador >= 3):
        return True
    return False

#Ej 2
#1.
def pares_por_0_inout(numeros:[int]) -> [int]:
    for i in range(len(numeros)):
        if(i % 2 == 0):
            numeros[i] = 0
    return numeros

#2.
def pares_por_0_in(numeros:[int]) -> [int]:
    nuevaLista:[int] = []
    for i in range(len(numeros)):
        if(i % 2 == 0):
            nuevaLista.append(0)
        else:
            nuevaLista.append(numeros[i])
    return nuevaLista

#3.
def removedor_de_vocales(palabra:str) -> str:
    palabraOriginal:str = list(palabra)
    palabraNueva:str = []
    vocales:[str] = list("aAeEiIoOuU")

    for i in range(len(palabraOriginal)):
        if(not(pertenece(palabraOriginal[i],vocales))):
            palabraNueva.append(palabraOriginal[i])

    respuesta:str = ""

    for i in palabraNueva:
        respuesta+=i

    return respuesta

#4.
def reemplazador_de_vocales(palabra:str) -> str:
    palabraOriginal:str = list(palabra)
    palabraNueva:str = []
    vocales:[str] = list("aAeEiIoOuU")

    for i in range(len(palabraOriginal)):
        if(not(pertenece(palabraOriginal[i],vocales))):
            palabraNueva.append(palabraOriginal[i])
        else:
            palabraNueva.append("_")

    respuesta:str = ""

    for i in palabraNueva:
        respuesta+=i

    return respuesta


#5.
def da_vuelta_str(palabra:str) -> str:
    palabraOriginal:str = list(palabra)
    palabraNueva:str = []

    for i in palabraOriginal:
        palabraNueva.append(i)
    palabraRevertida = list(reversed(palabraNueva))
    return palabraRevertida


#Ej 3
#1.
def mis_estudiantes() -> [str]:
    estudiantes:[str] = []
    while(True):
        inpet:str = input()
        if(inpet == "listo"):
            return estudiantes
        else:
            estudiantes.append(inpet)
    return estudiantes

#2.

print(mis_estudiantes())
def ordenados(x:list)->bool:
    for i in range(len(x)-1):
        if x[i]>=x[i+1]:
            return False 
    return True

def filasOrdenadas(seq:[[int]]) -> [bool]:
    response:[bool] = []
    for list in seq:
        if(ordenados(list)):
            response.append(True)
        else:
            response.append(False)
    print(response)


def elevar_matriz(size:int, power:float) -> [[int]]:
    matrix:[[int]] = numpy.random.random((size, size))
    answer:[[int]] = []
    actualSize:int = size-1
    while(power>0):
        answer = numpy.dot(matrix,matrix)
        matrix = answer
        power = power -1
        print(answer)
    return answer

print(elevar_matriz(50,3))
        

