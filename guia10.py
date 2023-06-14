import csv
from random import sample
from queue import LifoQueue as Pila

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
    numbers: list[int] = range(desde, hasta)
    return sample(numbers, cantidad)

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
print(buscarElMaximo(pila))

#Ej 12: Ni en pedo

#Ej 13
