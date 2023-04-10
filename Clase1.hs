f :: Integer -> Integer
f 1 = 8
f 4 = 131
f 16 = 16
f n = undefined

-- problema g (n:Z) : Z {
--  requiere: {n = 8 V n = 16 V n = 131}
--  asegura: { (n = 8 -> res = 16) Y (n = 16 -> 4) Y (n = 131 -> res = 1))}   
--}

g :: Integer -> Integer
g 8 = 16
g 16 = 4
g 131 = 1
g n = undefined

h :: Integer -> Integer
h n = f(g(n))

k :: Integer -> Integer
k n = g(f(n))
