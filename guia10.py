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
    nuevo = open("nuevo.txt", "w")
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
            

revertirArchivo("test.txt")