from typing import List
from typing import Dict
import json

def unir_diccionarios(a_unir: List[Dict[str,int]]) -> Dict[str,List[int]]:
  responseDict: Dict[str,List[str]] = {}
  keyList: List[str] = []
  valueListCollection: List[List[int]] = []

  for dict in a_unir:
     for key in (dict.keys()):
        if(key not in keyList):
          keyList.append(key)

  for key in keyList:
     valueList: List[int] = []
     for dict in a_unir:
        for dictKey in (dict.keys()):
           if(key == dictKey):
             valueList.append(dict.get(dictKey))
     valueListCollection.append(valueList)
     
  for i in range(len(keyList)):
     responseDict.setdefault(keyList[i],valueListCollection[i])

  #print(keyList)
  #print(valueListCollection)
  #print(responseDict)
  return responseDict

#Pruebas:
#unir_diccionarios([{"a":2},{"b":3,"a":1},{"c":4}])
#unir_diccionarios([{"a": 1, "b": 2}, {"b": 3, "c": 4}, {"a": 5}])
#unir_diccionarios([{"a":1}])
#unir_diccionarios([])
#unir_diccionarios([{"a": 1, "b": 2}, {"b": 3, "c": 4}, {"a": 5}, {"b":3}])

if __name__ == '__main__':
  x = json.loads(input()) # Ejemplo de input: [{"a":2},{"b":3,"a":1}]
  print(unir_diccionarios(x))