module Orbits where

type Transform t = t -> t

class Powerable t where
	power :: t -> Int -> Transform t -> t

instance Powerable Int where
	power x 0 _ = 1
	power x 1 _ = x
	power x n f = power (f x) (n - 1) f