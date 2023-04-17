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
--            ((c>=a) Y (c>=b)) -> res = c) }
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

-- f) 
-- problema mismoIntervalo (a: R, b: R): Bool {
--  Require: { True }
--  Asegura: { (a <= 3) Y (b <=3 ) -> res = True }
--  Asegura: { ((a > 3) Y (a <= 7 )) Y ((b > 3) Y (b <= 7)) -> res = True }
--  Asegura: { (a > 7) Y (b > 7 ) -> res = True}
--}

mismoIntervalo :: Float -> Float -> Bool
mismoIntervalo a b | a <= 3 && b <= 3 = True
                   | a > 7 && b > 7 = True
                   | a > 3 && b > 3 && a <= 7 && b <= 7 = True
                   | otherwise = False

-- g)
-- problema sumaDistintos (a: Z, b: Z, c: Z): Z {
--  Asegura: { ((a != b) Y (a != c) Y (b != c)) -> res = a + b + c }
--  Asegura: { ((a = b) Y (b != c)) -> res = b + c }
--  Asegura: { ((b = c) Y (b != a)) -> res = b + a }
--  Asegura: { ((c = b) Y (c != a)) -> res = a + c }
--  Asegura: { (a = b = c) -> res = 0 }
--}

sumaDistintos :: Integer -> Integer -> Integer -> Integer
sumaDistintos a b c | a /= b && a /= c && b /= c = a + b + c
                    | a == b && c /= c = b + c
                    | b == c && b /= a = b + a
                    | c == b && c /= a = a + c
                    | a == b && b == c = 0

-- h)
-- problema esMultiploDe (a: Z, b: Z: Bool {
--  Require: { (a > 0) Y (b > 0) }
--  Asegura: { (a mod b = 0) -> res = True }
--}

esMultiploDe :: Integer -> Integer -> Bool
esMultiploDe a b | mod a b == 0 = True
                 | otherwise = False


-- i) 
-- problema digitoUnidades (a: N): N {
--  Asegura: { res = (mod a 10) }
--}

digitoUnidades :: Integer -> Integer
digitoUnidades a | a < 10 = a
                 | otherwise = mod a 10

-- j)
-- problema digitoDecenas (a: N): N {
--  Asegura: { res = digitoUnidades(a/10) }
--}

digitoDecenas :: Integer -> Integer
digitoDecenas a | a < 100 = a
                | otherwise = mod a 100


-- ej 4 Especificar e implementar

-- a)
-- problema prodInt (A: Seq<R>, B: Seq<R>): N {
--  Requiere: { |A| = |B| }
--  Asegura: { res = SUM(i=0, |A| - 1, A[i] * b[i]) }
--}

prodInt :: (Integer, Integer) -> (Integer, Integer) -> Integer
prodInt (ax, ay) (bx, by) = (ax * bx) + (ay * by)

-- b)
-- problema todoMenor (A: Seq<R>, B: Seq<R>): Bool {
--  Requiere: { |A| = |B| }
--  Asegura: {(for i in R)(0 <= i < |A| - 1) Y (A[i] < B[i])}
--}

todoMenor :: (Integer, Integer) -> (Integer, Integer) -> Bool
todoMenor (ax, ay) (bx, by) | ax < bx && ay < by = True
                            | otherwise = False

-- c)
-- problema distanciaPuntos (A: Seq<R>, B: Seq<R>): N {
--  Requiere: { |A| = |B| }
--  Asegura: { res = sqrt(SUM(i=0, |A| - 1, (B[i] - A[i])^2 )) }
--} 

distanciaPuntos :: (Double, Double) -> (Double, Double) -> Double
distanciaPuntos (ax, ay) (bx, by) = sqrt (((bx - ax)^2) + ((by - ay)^2))

-- d)
-- problema sumaTerna (A: Seq<Z>): Z {
-- Requiere: {|A| < 4 }
-- Asegura: { res = A[0] + A[1] + A[2] }
--}

sumaTerna :: (Integer, Integer, Integer) -> Integer
sumaTerna (ax, ay, az) = ax + ay + az

-- e)
-- problema sumaSoloMultiplos (A: Seq<Z>, b: N): Z {
-- Require: { |A| > 0 }
-- Asegura: { res = SUM(i = 0, |A| - 1, [if esMultiploDe(A[i], b) then A[i] else 0 fi])}
--}

sumaSoloMultiplos :: (Integer,Integer,Integer) -> Integer -> Integer
sumaSoloMultiplos (x,y,z) a | esMultiploDe x a  && esMultiploDe y a  && esMultiploDe z a  = x + y + z
                             | not(esMultiploDe x a) && esMultiploDe y a && esMultiploDe z a  = y + z
                             | esMultiploDe x a && not(esMultiploDe y a) && esMultiploDe z a  = x + z
                             | esMultiploDe x a  && esMultiploDe y a && not(esMultiploDe z a) = x + y
                             | not(esMultiploDe x a) && not(esMultiploDe y a) && esMultiploDe z a  = z
                             | esMultiploDe x a && not(esMultiploDe y a) && not(esMultiploDe z a)  = x
                             | not(esMultiploDe x a) && esMultiploDe y a && not(esMultiploDe z a)  = y
                             | otherwise = 0

-- f)
-- problema posPrimerPar (A: Seq<Z>): Z {
--  Asegura: { (esPar(A[0]) --> res = 0) V (esPar(A[1]) --> res = 1) V (esPar(A[2]) --> res = 2) V ((esPar(A[0]) = esPar(A[1]) = esPar(A[2]) = False ) --> res = 4) }
--
--}

-- problema esPar (n: Z): Bool {
-- Asegura { res = True <--> (n mod 2 = 0) }
--}

esPar :: Integer -> Bool
esPar n | mod n 2 == 0 = True
        | otherwise = False

posPrimerPar :: (Integer, Integer, Integer) -> Integer
posPrimerPar (x, y, z) | esPar x = 0
                       | esPar y = 1
                       | esPar z = 2
                       | otherwise = 4 

-- g)
-- problema crearPar (a: any, b: any): (a, b) {
-- Asegura: { res = (a, b) }
--}

crearPar :: any -> any -> (any, any)
crearPar a b = (a, b)

-- h)
-- problema invertir (a: any, b: any): (b, a) {
-- Asegura: { res = (b, a) }
--}

invertir :: (any, any) -> (any, any)
invertir (a, b) = (b, a)