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
mismosElementos a b | longitud a /= longitud b = False
                    | otherwise = mismosElementosAux (eliminarRepetidos a) (eliminarRepetidos b)

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
-- 3.

maximo :: [Integer] -> Integer
maximo [x] = x
maximo (x:y:xs) | x > y = maximo (x:xs)
                | otherwise = maximo (y:xs)

-- 7.
pares :: [Integer] -> [Integer]
pares [] = []
pares (x:xs) | mod x 2 == 0 = [x] ++ pares xs
             | mod x 2 /= 0 = pares xs