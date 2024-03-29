(define
    (problem problem_16_01)
    (:domain cube3)
    (:objects Y W B G O R)
    (:init
 (cube1 R B Y)
(cube2 W O G)
(cube3 O Y G)
(cube4 W R G)
(cube5 B W R)
(cube6 O Y B)
(cube7 G R Y)
(cube8 W B O)
(edge12 G R)
(edge24 G O)
(edge34 W G)
(edge13 R W)
(edge15 W O)
(edge26 G Y)
(edge48 O B)
(edge37 B W)
(edge56 Y B)
(edge68 R Y)
(edge78 O Y)
(edge57 B R)
        
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