import Orbits

a = 5 :: Int
b = 3 :: Int

instance Powerable Int
main = putStrLn (show (power a b (\i -> i * a)))

