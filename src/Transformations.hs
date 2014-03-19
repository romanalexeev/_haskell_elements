module Transformations where

type Transform t = t -> t
type IsEquals t = t -> t -> Bool

class Transformable t where
	
	power_unary :: t -> Int -> Transform t -> t
	power_unary x 0 _ = x
	power_unary x n f = power_unary (f x) (n - 1) f	

	distance :: t -> t -> Transform t -> IsEquals t -> Int -> IsEquals Int -> Int
	distance x y f eqt a eqi = distance_acc x y f eqt 0 a eqi
		where
			distance_acc :: t -> t -> Transform t -> IsEquals t -> Int -> Int -> IsEquals Int -> Int
			distance_acc x y f eqt n a eqi
				| eqi n a = -1
				| eqt x y = n
				| otherwise = distance_acc (f x) y f eqt  (n + 1) a eqi

