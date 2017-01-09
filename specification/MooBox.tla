(* A cow runs on the side of a moo-box, the border is acting as the ground. The
box has to be flipped to avoid obstacles. *)

---- MODULE MooBox ----
EXTENDS Naturals
VARIABLES orientation, position

vars == <<orientation, position>>

Initial == /\ position = 0
           /\ orientation = "DOWN"

TypeInvariant == /\ orientation \in {"UP", "DOWN"}
                 /\ position \in (0..100)

FlipBox == /\ orientation' = IF orientation = "UP" THEN "DOWN" ELSE "UP"
           /\ UNCHANGED position

MoveRight == /\ position' = IF position # 100 THEN position + 1 ELSE 0
             /\ UNCHANGED orientation

Step == FlipBox \/ MoveRight
Spec == Initial /\ [] [Step]_vars

----
THEOREM Spec => []TypeInvariant
==========

Other theorem: flipping the box should
