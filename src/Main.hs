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
		y = 8 :: Int
		f = (\i -> i * x)
		eq = (\a b -> a == b)
		a = 10000
	in distance x y f eq a
	))


collision_point_test = putStrLn( show(
	let 
		x = 2 :: Int
		f = (\i -> if i < 10 then i + 1 else 0)
		eq = (\a b -> a == b)
		p = (\i -> True)
		a = 10000
		def = -1
	in collision_point x f eq a def
	))

main = collision_point_test

