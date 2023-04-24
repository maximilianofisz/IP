-- Guia 4
-- 1)

fibonacci :: Integer -> Integer
fibonacci n | n == 0 = 0
            | n == 1 = 1
            | otherwise = fibonacci (n - 1) + fibonacci (n - 2)

-- 2)

parteEntera :: Float -> Integer
parteEntera n | n >= 0 && n < 1 = 0
              | otherwise = 1 + parteEntera (n - 1)

-- 3) 

parteDecimal :: Float -> Float
parteDecimal n | n >= 0 && n < 1 = n
               | otherwise = parteDecimal (n - 1)


esDivisible :: Float -> Float -> Bool
esDivisible a b | a == b = True
                | b == 1 = True
                | parteDecimal (a / b) == 0 = True
                | otherwise = False

esDivisible2 :: Float -> Float -> Bool
esDivisible2 a b | a == b = True
                 | b == 1 = True
                 | a < b = False
                 | otherwise = esDivisible2 (a - b) b

-- 4)
sumaImpares :: Integer -> Integer
sumaImpares n | n == 1 = 1
              | otherwise = (2*n - 1) + sumaImpares (n-1)

-- 5)
medioFact :: Integer -> Integer
medioFact n | n == 0 = 1
            | n == 1 = 1
            | otherwise = n*medioFact (n-2)


-- 6)
sumaDigitos :: Integer -> Integer
sumaDigitos n | n <= 0 = 0
              | otherwise = mod n 10 + sumaDigitos (div n 10)

-- 7)

todosDigitosIguales :: Integer -> Bool
todosDigitosIguales n | n == 0 = True
                      | n > 0 && n < 10 = True
                      | otherwise = mod n 10 == mod (div n 10) 10 && todosDigitosIguales (div n 10)

-- 8) 
cantDigitos :: Integer -> Integer
cantDigitos n | n == 0 = 1
              | n > 0 && n < 10 = 1
              | otherwise = 1 + cantDigitos (div n 10)

iesimoDigito :: Integer -> Integer -> Integer
iesimoDigito n i = mod (div n (10^((cantDigitos n) - i))) 10

-- 9)
-----------------------NO FUNCIONA!!!!!
esCapicua :: Integer -> Bool
esCapicua n | cantDigitos n == 1 = True
            | otherwise = iesimoDigito n 1 == iesimoDigito n (cantDigitos n) && esCapicua (mod (div n 10) 10) 


-- 10)

-- a)

f1 :: Integer -> Integer
f1 n | n == 0 = 1
     | otherwise = 2^n + f1 (n - 1)

-- b)

f2 :: Integer -> Integer -> Integer
f2 n q | n == 1 = q^n
       | otherwise = q^n + f2 (n - 1) q

-- c)
f3 :: Integer -> Integer -> Integer
f3 n q = f3aux (2 * n) q

f3aux :: Integer -> Integer -> Integer
f3aux n q | n == 1 = q^n
          | otherwise = q^n + f3aux (n - 1) q

-- d)
f4 :: Integer -> Integer -> Integer
f4 n q = f4aux (2 * n) q n

f4aux :: Integer -> Integer -> Integer -> Integer
f4aux n q i | i == n = q^n
            | otherwise = q^n + f4aux (n - 1) q i 

-- 11)

--a)

factorial :: Float -> Float
factorial n | n == 0 = 1
            | otherwise = n * (factorial (n - 1))


eAprox :: Integer -> Float
eAprox n | n == 0 = 1 / (factorial (fromIntegral n))
         | otherwise =  (1 / factorial (fromIntegral n)) + eAprox (n - 1)

-- b)

e :: Float
e = eAprox 10

-- 12)

raizDe2Aprox :: Integer -> Float
raizDe2Aprox n | n == 1 = 1
               | otherwise = (raizDe2AproxSuc n) - 1

raizDe2AproxSuc :: Integer -> Float
raizDe2AproxSuc n | n == 1 = 2
                  | otherwise = 2 + (1 / ((raizDe2AproxSuc (n- 1)))) 

-- 13)

f13 :: Integer -> Integer -> Integer
f13 n m | n == 1 = f13Aux n m
f13 n m | otherwise = f13Aux n m + f13 (n - 1) m


f13Aux :: Integer -> Integer -> Integer
f13Aux n m | m == 1 = n^m
           | otherwise = n^m + f13Aux n (m - 1)

-- 14) 

sumaPotencias :: Integer -> Integer -> Integer -> Integer
sumaPotencias q n m | n == 1 = sumaPotenciasAux q 1 m
                    | otherwise = sumaPotenciasAux q n m + sumaPotencias q (n - 1) m


sumaPotenciasAux :: Integer -> Integer -> Integer -> Integer
sumaPotenciasAux q n m | m == 1 = q^(n + m)
                       | otherwise = q^(n + m) + sumaPotenciasAux q n (m - 1)

-- 15)

sumaRacionales :: Integer -> Integer -> Float
sumaRacionales p q | p == 1 = sumaRacionalesAux p q
                   | otherwise = sumaRacionalesAux p q + sumaRacionales (p - 1) q


sumaRacionalesAux :: Integer -> Integer -> Float
sumaRacionalesAux p q | q == 1 = fromInteger p
                      | otherwise = (fromInteger p) / (fromInteger q) + sumaRacionalesAux p (q - 1)


-- 16)

menorDivisor :: Integer -> Integer
menorDivisor n = menorDivisorAux n 2

menorDivisorAux :: Integer -> Integer -> Integer
menorDivisorAux n i | mod n i == 0 = i
                    | n == i = n
                    | otherwise = menorDivisorAux n (i+1)

esPrimo :: Integer -> Bool
esPrimo n | menorDivisor n == n = True
          | otherwise = False

sonCoprimos :: Integer -> Integer -> Bool
sonCoprimos a b | mcd a b == 1 = True
                | otherwise = False


mcd :: Integer -> Integer -> Integer
mcd a b | a == b = 1
        | mod a b == 0 = b
        | otherwise = mcd b (mod a b)

nEsimoPrimo :: Integer -> Integer
nEsimoPrimo n = nEsimoPrimoAux n 2 0

nEsimoPrimoAux :: Integer -> Integer -> Integer -> Integer
nEsimoPrimoAux n i c | n == c = (i-1)
                     | esPrimo i = nEsimoPrimoAux n (i+1) (c+1)
                     | esPrimo i == False = nEsimoPrimoAux n (i+1) c

-- 17)

esFibonacci :: Integer -> Bool
esFibonacci n = esFibonacciAux n 0

esFibonacciAux :: Integer -> Integer -> Bool
esFibonacciAux n i | n == fibonacci i = True
                   | n < fibonacci i = False
                   | otherwise = esFibonacciAux n (i+1)


-- 18) 
mayorDigitoPar :: Integer -> Integer
mayorDigitoPar n = mayorDigitoParAux n (-1) (cantDigitos n)

mayorDigitoParAux :: Integer -> Integer -> Integer -> Integer
mayorDigitoParAux n c d | d == 0 = c
                        | esPar (mod n 10) = mayorDigitoParAux (div n 10) (mod n 10) (d-1)
                        | otherwise = mayorDigitoParAux (div n 10) c (d-1)

esPar :: Integer -> Bool
esPar n | mod n 2 == 0 = True
        | otherwise = False


-- 21 )
