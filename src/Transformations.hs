module Transformations where

type Transform t = t -> t

class Transformable t where
	
	power_unary :: t -> Int -> Transform t -> t
	power_unary x 0 _ = x
	power_unary x n f = power_unary (f x) (n - 1) f	

	distance :: (Eq t) => t -> t -> Transform t -> Int -> Int
	distance x y f a = distance_acc x y f 0 a
		where
			distance_acc :: (Eq t) => t -> t -> Transform t -> Int -> Int -> Int
			distance_acc x y f n a
				| n == a = -1
				| x == y = n
				| otherwise = distance_acc (f x) y f (n + 1) a

	collision_point :: (Eq t) => t -> Transform t -> Int -> t -> t
	collision_point x f a def = collision_point_recursive x (f x) f 0 a def
		where 
			collision_point_recursive :: (Eq t) => t -> t -> Transform t -> Int -> Int -> t -> t
			collision_point_recursive slow fast f n a def
				| n == a = def
				| fast == slow = fast
				| otherwise = collision_point_recursive (f slow) (f (f fast)) f (n + 1) a def