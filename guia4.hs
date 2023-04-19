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