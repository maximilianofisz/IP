from typing import List

# Aclaración: Debido a la versión de Python del CMS, para el tipo Lista, la sintaxis de la definición de tipos que deben usar es la siguiente:
# l: List[int]  <--Este es un ejemplo para una lista de enteros.
# Respetar esta sintaxis, ya que el CMS dirá que no pasó ningún test si usan otra notación.
def mesetaMasLarga(l: List[int]) -> int :
  if(len(l) == 0):
    return  0
  record:int = 0
  currentSize = 0
  if(len(l) == 1):
    return 1
  for i in range(len(l)):
    if(i==0):
      record = 1
      currentSize = 1
    elif(i == len(l)-1):
      if(l[i] == l[i-1]):
        currentSize = currentSize + 1
      if(currentSize > record):
        record = currentSize
    elif(l[i] == l[i-1]):
      currentSize = currentSize + 1
    else:
      if(currentSize > record):
        record = currentSize
      currentSize = 1
  return record


if __name__ == '__main__':
  x = input()
  print(mesetaMasLarga([int(j) for j in x.split()]))