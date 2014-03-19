module Transformations where

type Transform t = t -> t
type IsEquals t = t -> t -> Bool
--type Predicate t = t -> Bool

class Transformable t where
	
	power_unary :: t -> Int -> Transform t -> t
	power_unary x 0 _ = x
	power_unary x n f = power_unary (f x) (n - 1) f	

	distance :: t -> t -> Transform t -> IsEquals t -> Int -> Int
	distance x y f eq a = distance_acc x y f eq 0 a
		where
			distance_acc :: t -> t -> Transform t -> IsEquals t -> Int -> Int -> Int
			distance_acc x y f eq n a
				| n == a = -1
				| eq x y = n
				| otherwise = distance_acc (f x) y f eq (n + 1) a

	collision_point :: t -> Transform t -> IsEquals t -> Int -> t -> t
	collision_point x f eq a def = collision_point_recursive x (f x) f eq 0 a def
		where 
			collision_point_recursive :: t -> t -> Transform t -> IsEquals t -> Int -> Int -> t -> t
			collision_point_recursive slow fast f eq n a def
				| n == a = def
				| eq fast slow = fast
				| otherwise = collision_point_recursive (f slow) (f (f fast)) f eq (n + 1) a def