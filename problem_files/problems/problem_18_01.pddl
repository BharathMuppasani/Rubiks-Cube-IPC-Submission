(define
    (problem problem_18_01)
    (:domain cube3)
    (:objects Y W B G O R)
    (:init
 (cube1 O W G)
(cube2 R W G)
(cube3 B Y O)
(cube4 R B Y)
(cube5 R B W)
(cube6 W O B)
(cube7 Y O G)
(cube8 R G Y)
(edge12 B R)
(edge24 Y O)
(edge34 W R)
(edge13 O B)
(edge15 O W)
(edge26 O G)
(edge48 G R)
(edge37 Y R)
(edge56 W G)
(edge68 G Y)
(edge78 B W)
(edge57 B Y)
        
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