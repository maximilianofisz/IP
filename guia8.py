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
        

