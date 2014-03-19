import Transformations

instance Transformable Int



main = putStrLn( show( 
	let 
		x = 5 :: Int
		n = 1 :: Int
		f = (\i -> i * x)
	in power x n f))


