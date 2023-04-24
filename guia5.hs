-- 1) 



-- .4
reverso :: [t] -> [t]
reverso [] = []
reverso (x:xs) = reverso xs ++ [x]


-- 2)
-- .3

todosDistintos :: [Int] -> Bool
todosDistintos [] = True
todosDistintos (x:xs) =  todosDistintos xs && not(pertenece x xs)

pertenece :: Int -> [Int] -> Bool
pertenece n [] = False
pertenece n (x:xs) = (n == x)

-- 3)
-- .3

maximo :: [Integer] -> Integer
maximo [x] = x
maximo (x:y:xs) | x > y = maximo (x:xs)
                | otherwise = maximo (y:xs)

-- .7
pares :: [Integer] -> [Integer]
pares [] = []
pares (x:xs) | mod x 2 == 0 = [x] ++ pares xs
             | mod x 2 != 0 = pares xs