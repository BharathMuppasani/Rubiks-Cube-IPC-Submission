(define
    (problem problem_14_01)
    (:domain cube3)
    (:objects Y W B G O R)
    (:init
 (cube1 Y B O)
(cube2 R W G)
(cube3 B O W)
(cube4 R Y G)
(cube5 W R B)
(cube6 O W G)
(cube7 R B Y)
(cube8 O Y G)
(edge12 W G)
(edge24 Y O)
(edge34 W O)
(edge13 B W)
(edge15 R Y)
(edge26 W R)
(edge48 O B)
(edge37 O G)
(edge56 Y G)
(edge68 R B)
(edge78 Y B)
(edge57 R G)
        
    )
    (:goal
        (and
            (cube1 R W B)
            (cube2 O W B)
            (cube3 R Y B)
            (cube4 O Y B)
            (cube5 R W G)
            (cube6 O W G)
            (cube7 R Y G)
            (cube8 O Y G)

            (edge12 W B)
            (edge24 O B)
            (edge34 Y B)
            (edge13 R B)

            (edge15 R W)
            (edge26 O W)
            (edge48 O Y)
            (edge37 R Y)

            (edge56 W G)
            (edge68 O G)
            (edge78 Y G)
            (edge57 R G)
 
        )
    )
)