import sys

def fibonacciNoRecursivo(n: int) -> int:
  if(n == 0):
    return 0
  elif(n == 1):
    return 1
  else:
    seq:[int] = [0,1]
    for i in range(n-1):
      seq.append(seq[-1]+seq[-2])
    return seq[-1]
    

if __name__ == '__main__':
  x = int(input())
  print(fibonacciNoRecursivo(x))