from typing import List

# Aclaración: Debido a la versión de Python del CMS, para el tipo Lista, la sintaxis de la definición de tipos que deben usar es la siguiente:
# l: List[int]  <--Este es un ejemplo para una lista de enteros.
# Respetar esta sintaxis, ya que el CMS dirá que no pasó ningún test si usan otra notación.
def filasParecidas(matriz: List[List[int]]) -> bool :
  for i in range(len(matriz)-1):
    currentDelta:int = abs(matriz[i][0] - matriz[i+1][0])
    for j in range(len(matriz[i])):
      if(abs(matriz[i][j]-matriz[i+1][j]) != currentDelta):
        return False
  return True

def abs(num:int) -> int:
  return int((num*num)**(1/2))
  
print(filasParecidas([[1]]))

#if __name__ == '__main__':
#  filas = int(input())
#  columnas = int(input())
# 
#  matriz = []
# 
#  for i in range(filas):         
#    fila = input()
#    if len(fila.split()) != columnas:
#      print("Fila " + str(i) + " no contiene la cantidad adecuada de columnas")
#    matriz.append([int(j) for j in fila.split()])
#  
#  print(filasParecidas(matriz))