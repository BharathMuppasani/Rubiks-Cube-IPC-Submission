(define
    (problem problem_13_01)
    (:domain cube3)
    (:objects Y W B G O R)
    (:init
 (cube1 B Y R)
(cube2 W B O)
(cube3 O G W)
(cube4 Y G R)
(cube5 Y G O)
(cube6 O Y B)
(cube7 W B R)
(cube8 W G R)
(edge12 G R)
(edge13 W R)
(edge15 W B)
(edge24 Y B)
(edge26 O W)
(edge34 Y O)
(edge37 R Y)
(edge48 Y G)
(edge56 G O)
(edge57 B R)
(edge68 G W)
(edge78 O B)
        
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