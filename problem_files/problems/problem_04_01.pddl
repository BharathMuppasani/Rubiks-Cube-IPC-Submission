(define
    (problem problem_04_01)
    (:domain cube3)
    (:objects Y W B G O R)
    (:init
 (cube1 O G Y)
(cube2 R G Y)
(cube3 R B W)
(cube4 O B W)
(cube5 O G W)
(cube6 R G W)
(cube7 R B Y)
(cube8 O B Y)
(edge12 G Y)
(edge24 O W)
(edge34 Y B)
(edge13 R W)
(edge15 G R)
(edge26 B W)
(edge48 O B)
(edge37 R B)
(edge56 G W)
(edge68 O Y)
(edge78 O G)
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