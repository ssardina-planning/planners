(define (problem inventory-path1)
(:domain inventory-path)

(:objects
	up down left right upleft upright downleft downright -DIR
	c507-273 c506-273 c507-274 c507-272 -LOC)

(:init
(adjacent c507-273 c506-273 up nokey)
(adjacent c507-273 c506-272 upleft nokey)
(adjacent c507-273 c506-274 upright nokey)
(adjacent c507-273 c507-272 left nokey)
(adjacent c507-273 c507-274 right nokey)
(adjacent c507-274 c506-274 up nokey)
(adjacent c507-274 c506-273 upleft nokey)
(adjacent c507-274 c507-273 left nokey)
(at-robot c507-274)
)

(:goal (at-robot c507-273))
)


