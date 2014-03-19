import Transformations

instance Transformable Int

main = putStrLn( show( 
	let 
		x = 10 :: Int
		n = 3 :: Int
		f = (\i -> i * x)
	in power 1 n f))


