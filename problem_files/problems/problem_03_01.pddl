(define
    (problem problem_03_01)
    (:domain cube3)
    (:objects Y W B G O R)
    (:init
 (cube1 O Y B)
(cube2 R B W)
(cube3 O W B)
(cube4 W G O)
(cube5 W G R)
(cube6 Y O G)
(cube7 R B Y)
(cube8 Y R G)
(edge12 Y B)
(edge24 R W)
(edge34 W B)
(edge13 O B)
(edge15 W G)
(edge26 O W)
(edge48 O Y)
(edge37 R B)
(edge56 O G)
(edge68 Y G)
(edge78 R G)
(edge57 R Y)
        
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