(define (domain inventory-path)
(:requirements :typing)
(:types LOC DIR KEY)
(:constants nokey - KEY)
(:predicates 
             (at-robot ?l - LOC)
             (at-key ?k - KEY ?l - LOC)
             (adjacent ?l1 - LOC ?l2 - LOC ?d - DIR ?key - KEY) 
             (holding ?k - KEY)
)

(:action move
:parameters (?from - LOC ?to - LOC ?dir - DIR)
:precondition (and (at-robot ?from) (adjacent ?from ?to ?dir nokey))
:effect (and (at-robot ?to) (not (at-robot ?from)))
)
             

)
