import Transformations

instance Transformable Int

power_unary_test = putStrLn( show( 
	let 
		x = 10 :: Int
		n = 3 :: Int
		f = (\i -> i * x)
	in power_unary 1 n f))

distance_test = putStrLn( show(
	let 
		x = 2 :: Int
		y = 3 :: Int
		f = (\i -> i * x)
		eq = (\a b -> a == b)
		a = 10000
	in distance 1 y f eq a eq
	))

main = distance_test

