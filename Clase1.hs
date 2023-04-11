-- EJ 1
-- a)

f :: Integer -> Integer
f 1 = 8
f 4 = 131
f 16 = 16
f n = undefined

-- b)
-- problema g (n:Z) : Z {
--  requiere: {n = 8 V n = 16 V n = 131}
--  asegura: { (n = 8 -> res = 16) Y (n = 16 -> 4) Y (n = 131 -> res = 1))}   
--}
-- c)
g :: Integer -> Integer
g 8 = 16
g 16 = 4
g 131 = 1
g n = undefined

h :: Integer -> Integer
h n = f(g(n))

k :: Integer -> Integer
k n = g(f(n))

-- Ej 2
-- a)
-- problema absoluto (n: Z) : Z {
--  Requiere: { True }
--  Asegura: { res = sqrt(n²) }
--}

absoluto :: Integer -> Integer
absoluto n | n < 0 = (-n)
absoluto n | otherwise = n

-- b)
-- problema maximoabsoluto (a: Z, b: Z) : Z {
--  Asegura: { ((a => b) -> (res = a) Y (a < b) -> (res = b))}   
--}

maximoabsoluto :: Integer -> Integer -> Integer
maximoabsoluto a b | a >= b = a
                   | otherwise = b

-- c)
-- problema maximo3 (a: Z, b: Z, c: Z ) : Z {
--  Asegura: {(((a>=b) Y (a>=c)) -> res = a) Y
--            ((b>=a) Y (b>=c)) -> res = b) Y
--            ((c>=a) Y (c>=a)) -> res = c) }
--}

maximo3 :: Integer -> Integer -> Integer -> Integer
maximo3 a b c | a>=b && a>=c = a
              | b>=a && b>=c = b
              | c>=a && c>=b = c

-- d)
-- problema algunoEs0 (a: Q, b: Q) : Bool {
--  Asegura: { ((a = 0) V (b = 0)) -> (res = True)}
--  Asegura: { ((a != 0) V (b != 0)) -> (res = False)}
--}


algunoEs0 :: Float -> Float -> Bool
algunoEs0 a b | a==0 || b==0 = True
              | otherwise = False

algunoEs0PM :: Float -> Float -> Bool
algunoEs0PM 0 b = True
algunoEs0PM a 0 = True
algunoEs0PM _ _ = False

-- e)
-- problema ambosSon0 (a: Q, b: Q): Bool {
--  Asegura: { ((a = 0) Y (b = 0)) -> (res = True)}
--  Asegura: { ((a != 0) V (b != 0)) -> (res = False)}
--}

ambosSon0 :: Float -> Float -> Bool
ambosSon0 a b | a==0 && b == 0 = True
              | otherwise = False

ambosSon0PM :: Float -> Float -> Bool
ambosSon0PM 0 0 = True
ambosSon0PM _ _ = False
