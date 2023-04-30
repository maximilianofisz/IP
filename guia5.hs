
-- 1) 

--1.
longitud :: [t] -> Integer
longitud [] = 0
longitud (x:xs) = 1 + longitud (xs)

--2.
ultimo :: [t] -> t
ultimo [] = undefined
ultimo (x:xs) | longitud xs == 0 = x
              | otherwise = ultimo xs

--3.
principio :: [t] -> [t]
principio [] = undefined
principio (x:xs) | longitud xs == 0 = []
                 | otherwise = [x] ++ principio xs

-- 4.
reverso :: [t] -> [t]
reverso [] = []
reverso (x:xs) = reverso xs ++ [x]



-- 2)

-- 1.
pertenece :: (Eq t) => t -> [t] -> Bool
pertenece n [] = False
pertenece n (x:xs) | (n == x) = True
                   | otherwise = pertenece n xs



--2.
todosIguales :: (Eq t) => [t] -> Bool
todosIguales [] = True
todosIguales (x:xs) | longitud xs == 0 = True
                    | x == head xs = True && todosIguales xs
                    | otherwise = False


-- 3.
todosDistintos :: (Eq t) => [t] -> Bool
todosDistintos [] = True
todosDistintos (x:xs) =  todosDistintos xs && not(pertenece x xs)


--4.
hayRepetidos :: (Eq t) => [t] -> Bool
hayRepetidos [] = False
hayRepetidos n | todosDistintos n == True = False
               | otherwise = True

--5. 
quitar :: (Eq t) => t -> [t] -> [t]
quitar n [] = []
quitar n (x:xs) | n == x = xs
                | otherwise = [x] ++ quitar n xs

--6.
quitarTodos :: (Eq t) => t -> [t] -> [t]
quitarTodos n [] = []
quitarTodos n (x:xs) | n == x = quitarTodos n xs
                     | otherwise = [x] ++ quitarTodos n xs

--7.
eliminarRepetidos :: (Eq t) => [t] -> [t]
eliminarRepetidos [] = []
eliminarRepetidos (x:xs) | pertenece x xs = eliminarRepetidos xs
                         | otherwise = [x] ++ eliminarRepetidos xs

--8.
mismosElementos :: (Eq t) => [t] -> [t] -> Bool
mismosElementos [] [] = True
mismosElementos a b | otherwise = mismosElementosAux (eliminarRepetidos a) (eliminarRepetidos b)

mismosElementosAux :: (Eq t) => [t] -> [t] -> Bool
mismosElementosAux [] y = True
mismosElementosAux (x:xs) y | pertenece x y = True && mismosElementosAux xs y
                            | otherwise = False

--9.
capicua :: (Eq t) => [t] -> Bool
capicua [] = True
capicua (x:xs) | longitud xs == 0 = True
               | x == ultimo xs = True && capicua (principio xs)
               | otherwise = False


-- 3)
--1.
sumatoria :: [Integer] -> Integer
sumatoria [] = 0
sumatoria (x:xs) | longitud xs == 0 = x
                 | otherwise = x + sumatoria xs

--2.
productoria :: [Integer] -> Integer
productoria [] = 0
productoria (x:xs) | longitud xs == 0 = x
                   | otherwise = x * productoria xs

-- 3.
maximo :: [Integer] -> Integer
maximo [x] = x
maximo (x:y:xs) | x > y = maximo (x:xs)
                | otherwise = maximo (y:xs)

minimo :: [Integer] -> Integer
minimo [x] = x
minimo (x:y:xs) | x <= y = minimo (x:xs)
                | otherwise = minimo (y:xs)

-- 4.
sumarN :: Integer -> [Integer] -> [Integer]
sumarN n [] = []
sumarN 0 x = x
sumarN n (x:xs) | longitud xs == 0 = [x+n]
                | otherwise = [x+n] ++ sumarN n xs

-- 5.
sumarElPrimero :: [Integer] -> [Integer]
sumarElPrimero [] = []
sumarElPrimero (x:xs) = [x+x] ++ sumarN x xs

-- 6.
sumarElUltimo :: [Integer] -> [Integer]
sumarElUltimo [] = []
sumarElUltimo [n] = [n+n]
sumarElUltimo (x:xs) = [x + (ultimo xs)] ++ sumarN (ultimo xs) xs

-- 7.
pares :: [Integer] -> [Integer]
pares [] = []
pares (x:xs) | mod x 2 == 0 = [x] ++ pares xs
             | mod x 2 /= 0 = pares xs
             
-- 8.
multiplosDeN :: Integer -> [Integer] -> [Integer]
multiplosDeN 1 x = x
multiplosDeN 0 x = x
multiplosDeN n (x:xs) | longitud xs == 0 && mod x n == 0 = [x]
                      | longitud xs == 0 && mod x n /= 0 = []
                      | mod x n /= 0 = [] ++ multiplosDeN n xs
                      | otherwise = [x] ++ multiplosDeN n xs

-- 9.
ordenar :: [Integer] -> [Integer]
ordenar [] = []
ordenar (x:xs) | longitud xs == 0 = [x]
               | x <= minimo xs = [x] ++ ordenar xs
               | otherwise = ordenar (xs++[x])

-- 4)

--1.
sacarBlancosRepetidos :: [Char] -> [Char]
sacarBlancosRepetidos [] = []
sacarBlancosRepetidos [x] = [x]
sacarBlancosRepetidos (x:y:xs) | x == ' ' && y == ' ' = [' '] ++ sacarBlancosRepetidos xs
                               | otherwise = [x] ++ sacarBlancosRepetidos (y:xs)

--2.
contarPalabras :: [Char] -> Integer
contarPalabras n = contarPalabrasAux (sacarBlancosRepetidos n) 1

contarPalabrasAux :: [Char] -> Integer -> Integer
contarPalabrasAux (x:xs) c | longitud xs == 0 = c
                           | x == ' ' = contarPalabrasAux xs (c+1)
                           | otherwise = contarPalabrasAux xs c
                           
-- 3.
palabraMasLarga :: [Char] -> [Char]
palabraMasLarga x = palabraMasLargaAux (palabras x) []

palabraMasLargaAux :: [[Char]] -> [Char] -> [Char]
palabraMasLargaAux (a:b:c) p | longitud c == 0 && longitud a >= longitud b = a
                             | longitud c == 0 && longitud a < longitud b = b
                             | longitud a >= longitud b = palabraMasLargaAux (b:c) a
                             | otherwise = palabraMasLargaAux (b:c) p
                                
-- 4.
palabras :: [Char] -> [[Char]]
palabras [] = []
palabras x = primeraPalabra x : palabras (borrarPalabraAnterior x)


acomodarPrincipio :: [Char] -> [Char]
acomodarPrincipio [] = []
acomodarPrincipio x | head x == ' ' = tail x
                    | otherwise = x

acomodar :: [Char] -> [Char]
acomodar [] = []
acomodar x = reverso (acomodarPrincipio (reverso (acomodarPrincipio x)))

primeraPalabra :: [Char] -> [Char]
primeraPalabra [] = []
primeraPalabra (x:xs) | x/= ' ' = x : primeraPalabra xs
                      | otherwise = primeraPalabra []

borrarPalabraAnterior :: [Char] -> [Char]
borrarPalabraAnterior [] = []
borrarPalabraAnterior (x:xs) | x /= ' ' = borrarPalabraAnterior xs
                             | otherwise = acomodarPrincipio (x:xs)

-- 5.
aplanar :: [[Char]] -> [Char]
aplanar (x:xs) | longitud xs == 0 = aplanarAux x
               | otherwise = aplanarAux x ++ aplanar xs
               

aplanarAux :: [Char] -> [Char]
aplanarAux (x:xs) | longitud xs == 0 = [x]
                  | otherwise = x : aplanarAux (xs)

-- 6.
aplanarConBlancos :: [[Char]] -> [Char]
aplanarConBlancos (x:xs) | longitud xs == 0 = aplanarAux x
                         | otherwise = aplanarAux x ++ [' '] ++ aplanarConBlancos xs

-- 7.
aplanarConNBlancos :: [[Char]] -> Integer -> [Char]
aplanarConNBlancos (x:xs) n | longitud xs == 0 = aplanarAux x
                            | otherwise = aplanarAux x ++ (agregarBlancos n) ++ aplanarConNBlancos xs n


agregarBlancos :: Integer -> [Char]
agregarBlancos n | n == 0 = []
                 | otherwise = [' '] ++ agregarBlancos (n-1)


-- 5)

-- 1.
nat2Bin :: Integer -> [Integer]
nat2Bin n | n < 2 = [n]
          | otherwise = nat2Bin (div n 2) ++ [mod n 2] 


-- 2.
bin2nat :: [Integer] -> Integer
bin2nat n = bin2natAux n ((longitud n) -1)

bin2natAux :: [Integer] -> Integer -> Integer
bin2natAux (x:xs) n | n == 0 = x * (2^n)
                    | otherwise = (x * (2^n)) + bin2natAux xs (n-1)

-- 3.
nat2hex :: Integer -> [Char]
nat2hex n | div n 16 == 0 =  [mapN2Hex (mod n 16)]
          | otherwise = nat2hex (div n 16) ++ [mapN2Hex (mod n 16)] 

mapN2Hex :: Integer -> Char
mapN2Hex 0 = '0'
mapN2Hex 1 = '1'
mapN2Hex 2 = '2'
mapN2Hex 3 = '3'
mapN2Hex 4 = '4'
mapN2Hex 5 = '5'
mapN2Hex 6 = '6'
mapN2Hex 7 = '7'
mapN2Hex 8 = '8'
mapN2Hex 9 = '9'
mapN2Hex 10 = 'A'
mapN2Hex 11 = 'B'
mapN2Hex 12 = 'C'
mapN2Hex 13 = 'D'
mapN2Hex 14 = 'E'
mapN2Hex 15 = 'F'
mapN2Hex 16 = '0'
mapN2Hex n | n > 16 = mapN2Hex (n-16)

-- 4. 
sumaAcumulada :: (Num t) => [t] -> [t]
sumaAcumulada x = sumaAcumuladaAux x 0

sumaAcumuladaAux :: (Num t) => [t] -> t -> [t]
sumaAcumuladaAux (x:xs) c | longitud xs == 0 = [c+x]
                          | otherwise = [c+x] ++ sumaAcumuladaAux xs (c+x)

--5.
descomponerEnPrimos :: [Integer] -> [[Integer]]
descomponerEnPrimos (x:xs) | longitud xs == 0 = [descomponerEnPrimosAux x 2]
                           | otherwise = [descomponerEnPrimosAux x 2] ++ descomponerEnPrimos xs


descomponerEnPrimosAux :: Integer -> Integer -> [Integer]
descomponerEnPrimosAux n d | n == d = [n]
                           | mod n d /= 0 = descomponerEnPrimosAux n (d+1)
                           | otherwise = [d] ++ descomponerEnPrimosAux (div n d) d

-- 6)
-- 1.

type Set = []

agregarATodos :: Integer -> Set (Set Integer) -> Set (Set Integer)
agregarATodos n (x:xs) | longitud xs == 0 = [n : x]
                       | otherwise = [n : x] ++ agregarATodos n xs

-- 2.
partes :: Integer -> Set (Set Integer)
partes n | n == 0 = [[]]
         | otherwise = agregarATodos n (partes (n - 1)) ++ partes (n-1)

-- 3.

productoCartesiano :: Set Integer -> Set Integer -> Set (Integer, Integer)
productoCartesiano x (y:ys) | longitud ys == 0 = productoCartesianoAux y x
                                 | otherwise = productoCartesianoAux y x ++ productoCartesiano x ys

productoCartesianoAux :: Integer -> Set Integer -> Set (Integer, Integer)
productoCartesianoAux n (x:xs) | longitud xs == 0 = [(x,n)]
                               | otherwise = [(x,n)] ++ productoCartesianoAux n xs