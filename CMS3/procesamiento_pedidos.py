from queue import Queue
from typing import List
from typing import Dict
from typing import Union
import json


# ACLARACIÓN: El tipo de "pedidos" debería ser: pedidos: Queue[Dict[str, Union[int, str, Dict[str, int]]]]
# Por no ser soportado por la versión de CMS, usamos simplemente "pedidos: Queue"
def procesamiento_pedidos(pedidos: Queue,
                          stock_productos: Dict[str, int],
                          precios_productos: Dict[str, float]) -> List[Dict[str, Union[int, str, float, Dict[str, int]]]]:
  
  listaProcesados: List[Dict[str, Union[int, str, float, Dict[str, int]]]] = []
  
  #colaPedidos: Queue = Queue()
  #[colaPedidos.put(p) for p in pedidos]
  
  while(not(pedidos.empty())):
    pedido = pedidos.get()

    listaProductos: List[str] = list(pedido["productos"].keys())
    productosAdquiridos: Dict[str,int] = {}
    pedidoProcesado = {}
    pedidoProcesado["id"] = pedido["id"]
    pedidoProcesado["cliente"] = pedido["cliente"]
    completo:str = "completo"
    precio:float = 0.0

    for producto in listaProductos:
      if(stock_productos[producto] >= pedido["productos"][producto]):
        stock_productos[producto] = stock_productos[producto] - pedido["productos"][producto]
        productosAdquiridos[producto] = pedido["productos"][producto]
      elif(stock_productos[producto] == 0):
        completo = "incompleto"
        productosAdquiridos[producto] = 0
      else:
        completo = "incompleto"
        productosAdquiridos[producto] = stock_productos[producto]
        stock_productos[producto] = 0
    
    for producto in productosAdquiridos:
      precio = precio + (precios_productos[producto]*productosAdquiridos[producto])
    
    pedidoProcesado["productos"] = productosAdquiridos
    pedidoProcesado["precio_total"] = precio
    pedidoProcesado["estado"] = completo
    listaProcesados.append(pedidoProcesado)

    
  #print(listaProcesados)
  return listaProcesados


if __name__ == '__main__':
  pedidos: Queue = Queue()
  list_pedidos = json.loads(input())
  [pedidos.put(p) for p in list_pedidos]
  stock_productos = json.loads(input())
  precios_productos = json.loads(input())
  print("{} {}".format(procesamiento_pedidos(pedidos, stock_productos, precios_productos), stock_productos))

# Ejemplo input  
#pedidos = [{"id":21,"cliente":"Gabriela", "productos":{"Manzana":2}}, {"id":1,"cliente":"Juan","productos":{"Manzana":2,"Pan":4,"Factura":6}}]
#stock_productos = {"Manzana":10, "Leche":5, "Pan":3, "Factura":0}
#precios_productos = {"Manzana":3.5, "Leche":5.5, "Pan":3.5, "Factura":5}

#procesamiento_pedidos(coladora(pedidos), stock_productos, precios_productos)