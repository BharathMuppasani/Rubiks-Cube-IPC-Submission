(define
    (problem problem_09_01)
    (:domain cube3)
    (:objects Y W B G O R)
    (:init
 (cube1 R G W)
(cube2 O G W)
(cube3 W B O)
(cube4 G R Y)
(cube5 Y O B)
(cube6 O G Y)
(cube7 B Y R)
(cube8 R B W)
(edge12 W B)
(edge13 R W)
(edge15 R G)
(edge24 O W)
(edge26 O G)
(edge34 R Y)
(edge37 Y G)
(edge48 R B)
(edge56 O B)
(edge57 W G)
(edge68 O Y)
(edge78 Y B)
        
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