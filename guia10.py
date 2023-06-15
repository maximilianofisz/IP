import csv
from random import sample
import random
from queue import LifoQueue as Pila
from queue import Queue as Cola

#Ej 1
#1.
def contarLineas(nombre_archivo:str) -> int:
    file = open(nombre_archivo)
    lines:int = len(file.readlines())
    return lines

#2.
def existePalabra(palabra:str, nombre_archivo:str) -> bool:
    file = open(nombre_archivo)
    lines:str = file.readlines()
    for line in lines:
        if(palabra in line):
            return True
    return False

#3.
def cantidadApariciones(palabra:str, nombre_archivo:str) -> int:
    file = open(nombre_archivo)
    apariciones:int = 0
    lines:str = file.readlines()
    for line in lines:
        while (palabra in line):
            apariciones = apariciones + 1
            line = line[line.index(palabra)+len(palabra)-1:]
    return apariciones

#Ej 2
def clonarSinComentarios(nombre_archivo:str):
    original = open(nombre_archivo)
    nuevo = open("2.txt", "w")
    lines:str = original.readlines()
    for line in lines:
        print(line.index("#"))
        if line[0] != "#" and ("#" in line and not(line[0:line.index("#")] == (" " * (line.index("#"))))):
            nuevo.write(line)


#Ej 3
def revertirArchivo(nombre_archivo:str):
    original = open(nombre_archivo)
    nuevo = open("nuevo.txt", "w")
    lines = original.readlines()
    print(lines)
    lines.reverse()
    print(lines)
    for line in lines:
        if(not("\n" in line)):
            line = line + "\n"
        if(line == lines[len(line)]):
            line = line[0:len(line)-1]
        print(line)
        nuevo.write(line)
            
#Ej 4
def agregarFraseAlFinal(nombre_archivo:str, frase:str):
    archivo = open(nombre_archivo, "+a")
    archivo.write("\n"+frase)

#Ej 5
def agregarFraseAlPrincipio(nombre_archivo:str, frase:str):
    archivo = open(nombre_archivo, "r+")
    lines = archivo.readlines()
    lines.insert(0, frase+"\n")
    print(lines)
    archivo = open(nombre_archivo, "w")
    for line in lines:
        archivo.write(line)    
    
#Ej 6
# Ni en pedo

#Ej 7
def promedioNotasCSV(nombre_archivo:str, inLu: int) -> int:
     filo = open(nombre_archivo, "r")
     archivo = csv.reader(filo, delimiter=',')
     notas: float = 0
     numero: int = 0
     for row in archivo:
         if(row[0] == str(inLu)):
             notas = notas + int(row[2])
             numero = numero + 1
     print (notas / numero)

#Ej 8
def generarNrosAlAzar(cantidad:int, desde:int, hasta:int) -> list[int]:
    numbers: list[int] = []
    while(cantidad > 0):
        numbers.append(random.randint(desde, hasta))
        cantidad = cantidad - 1
    return numbers

#Ej 9
def generarPilaAlAzar() -> Pila:
    pila = Pila()
    for numero in (generarNrosAlAzar(3,0,10)):
        pila.put(numero)
    return pila
  
#Ej 10
def cantidadElementos(pila: Pila) -> int:
    amount: int = 0
    while(not(pila.empty())):
        pila.get()
        amount = amount + 1
    return amount

#Ej 11
def buscarElMaximo(pila: Pila) -> int:
    maximo: int = 0
    while(not(pila.empty())):
        removed:int = pila.get()
        if(removed > maximo):
            maximo = removed
    return maximo

pila: Pila =  generarPilaAlAzar()

#Ej 12: Ni en pedo

#Ej 13
def generarColaAlAzar() -> Cola:
    cola: Cola = Cola()
    numeros: list[int] = generarNrosAlAzar(10,1,10)
    for numero in numeros:
        cola.put(numero)
    return cola

cola: Cola = generarColaAlAzar()
#Ej 14
def cantidadElementosCola(cola: Cola) -> int:
    cantidad:int = 0
    while(not(cola.empty())):
        cantidad = cantidad + 1
        cola.get()
    return cantidad

#Ej 15
def buscarElMaximoCola(cola: Cola) -> int:
    maximo:int = 0
    while(not(cola.empty())):
        removed:int = cola.get()
        if(removed > maximo):
            maximo = removed
    return maximo

#Ej 16
#1.
def armarSecuenciaDeBingo() -> Cola[int]:
    secuencia = generarNrosAlAzar(99,0,99)
    cola: Cola = Cola()
    for numero in secuencia:
        cola.put(numero)        
    return cola

#2.
def jugarCartonDeBingo(carton: list[int], bolillero: Cola[int]) -> int:
    jugadas:int = 0
    while(len(carton) > 0):
        jugada = bolillero.get()
        if(jugada in carton):
            carton.remove(jugada)
            jugadas = jugadas + 1
        else:
            jugadas = jugadas + 1
    return jugadas
    


#Ej 17
def nPacientesUrgentes(cola: Cola[int]) -> int:
    numeroUrgentes: int = 0
    while(not(cola.empty())):
        if(cola.get() < 4):
            numeroUrgentes = numeroUrgentes + 1
    return numeroUrgentes


#Ej 18
def agruparPorLongitud(nombre_archivo:str) -> dict:
    archivo = open(nombre_archivo)
    response: dict = {}
    lines = archivo.readlines()
    for line in lines:
        line = separarPalabras(line)
        for palabra in line:
            if(len(palabra) not in response.keys()):
                response[len(palabra)] = 1
            else:
                response[len(palabra)] = response[len(palabra)] + 1 
            
    print(response)

def separarPalabras(palabras: str) -> list[str]:
    palabras = palabras.replace("\n","")
    response: list[str] = palabras.split(" ")
    return response



agruparPorLongitud("test.txt")