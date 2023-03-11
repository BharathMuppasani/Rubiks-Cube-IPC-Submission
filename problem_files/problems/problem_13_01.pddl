(define
    (problem problem_13_01)
    (:domain cube3)
    (:objects Y W B G O R)
    (:init
 (cube1 Y G R)
(cube2 R W G)
(cube3 O B Y)
(cube4 W B R)
(cube5 Y G O)
(cube6 W O B)
(cube7 B Y R)
(cube8 G W O)
(edge12 G R)
(edge24 O B)
(edge34 R B)
(edge13 O W)
(edge15 B W)
(edge26 G Y)
(edge48 Y R)
(edge37 R W)
(edge56 O G)
(edge68 B Y)
(edge78 O Y)
(edge57 G W)
        
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