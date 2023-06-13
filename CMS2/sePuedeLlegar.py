from typing import List
from typing import Tuple

# Aclaración: Debido a la versión de Python del CMS, para el tipo Lista y Tupla, la sintaxis de la definición de tipos que deben usar es la siguiente:
# l: List[int]  <--Este es un ejemplo para una lista de enteros.
# t: Tuple[str,str]  <--Este es un ejemplo para una tupla de strings.
# Respetar esta sintaxis, ya que el CMS dirá que no pasó ningún test si usan otra notación.
def sePuedeLlegar(origen: str, destino: str, vuelos: List[Tuple[str, str]]) -> int :
  anti_looper_previous_position_validator_9000:str = ""
  currentPosition:str = origen
  numberOfFlights:int = 0

  if(len(vuelos) == 0):
    return -1

  flag:bool = True
  while(flag):
    for i in range(len(vuelos)):
      if(vuelos[i][0] == currentPosition and vuelos[i][1] == destino):
        numberOfFlights = numberOfFlights + 1
        return numberOfFlights
      
      if(vuelos[i][0] == currentPosition):
        if(anti_looper_previous_position_validator_9000 == vuelos[i][1]):
          return -1
        anti_looper_previous_position_validator_9000 = currentPosition
        currentPosition = vuelos[i][1]
        numberOfFlights = numberOfFlights + 1
        break
      
      if(i == len(vuelos)-1):
        return -1
      

if __name__ == '__main__':
  origen = input()
  destino = input()
  vuelos = input()
  
  print(sePuedeLlegar(origen, destino, [tuple(vuelo.split(',')) for vuelo in vuelos.split()]))