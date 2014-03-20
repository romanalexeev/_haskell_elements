import Transformations

instance Transformable Int

power_unary_test = putStrLn( "power_unary_test: " ++ show( 
	let 
		x = 10 :: Int
		n = 3 :: Int
		f = (\i -> i * x)
	in power_unary 1 n f))

distance_test = putStrLn( "distance_test: " ++ show(
	let 
		x = 2 :: Int
		y = 32 :: Int
		f = (\i -> i * x)
		a = 10000
	in distance x y f a
	))

collision_point_test = putStrLn( "collision_point_test: " ++ show(
	let 
		x = 2 :: Int
		f = (\i -> if i < 10 then i + 1 else 4)
		p = (\i -> True)
		a = 10000
		def = -1
	in collision_point x f a def
	))

main = do
	power_unary_test
	distance_test
 	collision_point_test

