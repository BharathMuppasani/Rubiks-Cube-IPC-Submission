(define
    (domain cube3)
    (:requirements :strips :adl :typing :conditional-effects )
    (:predicates
        (cube1 ?x ?y ?z)
        (cube2 ?x ?y ?z)
        (cube3 ?x ?y ?z)
        (cube4 ?x ?y ?z)
        (cube5 ?x ?y ?z)
        (cube6 ?x ?y ?z)
        (cube7 ?x ?y ?z)
        (cube8 ?x ?y ?z)
        (edge12 ?y ?z)
        (edge13 ?x ?z)
        (edge15 ?x ?y)
        (edge26 ?x ?y)
        (edge24 ?x ?z)
        (edge48 ?x ?y)
        (edge34 ?y ?z)
        (edge37 ?x ?y)
        (edge56 ?y ?z)
        (edge57 ?x ?z)
        (edge68 ?x ?z)
        (edge78 ?y ?z)
    )

    (:action R
    :effect
        (and
            (forall (?x ?y ?z) (when (cube5 ?x ?y ?z) (and (not (cube5 ?x ?y ?z)) (cube7 ?y ?x ?z))))
            (forall (?x ?y ?z) (when (cube7 ?x ?y ?z) (and (not (cube7 ?x ?y ?z)) (cube8 ?y ?x ?z))))
            (forall (?x ?y ?z) (when (cube8 ?x ?y ?z) (and (not (cube8 ?x ?y ?z)) (cube6 ?y ?x ?z))))
            (forall (?x ?y ?z) (when (cube6 ?x ?y ?z) (and (not (cube6 ?x ?y ?z)) (cube5 ?y ?x ?z))))

            (forall (?x ?z) (when (edge57 ?x ?z) (and (not (edge57 ?x ?z)) (edge78 ?x ?z))))
            (forall (?y ?z) (when (edge78 ?y ?z) (and (not (edge78 ?y ?z)) (edge68 ?y ?z))))
            (forall (?x ?z) (when (edge68 ?x ?z) (and (not (edge68 ?x ?z)) (edge56 ?x ?z))))
            (forall (?y ?z) (when (edge56 ?y ?z) (and (not (edge56 ?y ?z)) (edge57 ?y ?z))))

        )
    )

    (:action R2
    :effect
        (and
            (forall (?x ?y ?z) (when (cube5 ?x ?y ?z) (and (not (cube5 ?x ?y ?z)) (cube8 ?x ?y ?z))))
            (forall (?x ?y ?z) (when (cube7 ?x ?y ?z) (and (not (cube7 ?x ?y ?z)) (cube6 ?x ?y ?z))))
            (forall (?x ?y ?z) (when (cube8 ?x ?y ?z) (and (not (cube8 ?x ?y ?z)) (cube5 ?x ?y ?z))))
            (forall (?x ?y ?z) (when (cube6 ?x ?y ?z) (and (not (cube6 ?x ?y ?z)) (cube7 ?x ?y ?z))))

            (forall (?x ?z) (when (edge57 ?x ?z) (and (not (edge57 ?x ?z)) (edge68 ?x ?z))))
            (forall (?y ?z) (when (edge78 ?y ?z) (and (not (edge78 ?y ?z)) (edge56 ?y ?z))))
            (forall (?x ?z) (when (edge68 ?x ?z) (and (not (edge68 ?x ?z)) (edge57 ?x ?z))))
            (forall (?y ?z) (when (edge56 ?y ?z) (and (not (edge56 ?y ?z)) (edge78 ?y ?z))))

        )
    )

    (:action Rrev
    :effect
        (and
            (forall (?x ?y ?z) (when (cube5 ?x ?y ?z) (and (not (cube5 ?x ?y ?z)) (cube6 ?y ?x ?z))))
            (forall (?x ?y ?z) (when (cube6 ?x ?y ?z) (and (not (cube6 ?x ?y ?z)) (cube8 ?y ?x ?z))))
            (forall (?x ?y ?z) (when (cube8 ?x ?y ?z) (and (not (cube8 ?x ?y ?z)) (cube7 ?y ?x ?z))))
            (forall (?x ?y ?z) (when (cube7 ?x ?y ?z) (and (not (cube7 ?x ?y ?z)) (cube5 ?y ?x ?z))))

            (forall (?x ?z) (when (edge57 ?x ?z) (and (not (edge57 ?x ?z)) (edge56 ?x ?z))))
            (forall (?y ?z) (when (edge78 ?y ?z) (and (not (edge78 ?y ?z)) (edge57 ?y ?z))))
            (forall (?x ?z) (when (edge68 ?x ?z) (and (not (edge68 ?x ?z)) (edge78 ?x ?z))))
            (forall (?y ?z) (when (edge56 ?y ?z) (and (not (edge56 ?y ?z)) (edge68 ?y ?z))))

        )
    )

    (:action L
    :effect
        (and
            (forall (?x ?y ?z) (when (cube1 ?x ?y ?z) 
                (and (not (cube1 ?x ?y ?z)) (cube2 ?y ?x ?z))))
            (forall (?x ?y ?z) (when (cube3 ?x ?y ?z) 
                (and (not (cube3 ?x ?y ?z)) (cube1 ?y ?x ?z))))
            (forall (?x ?y ?z) (when (cube4 ?x ?y ?z) 
                (and (not (cube4 ?x ?y ?z)) (cube3 ?y ?x ?z))))
            (forall (?x ?y ?z) (when (cube2 ?x ?y ?z) 
                (and (not (cube2 ?x ?y ?z)) (cube4 ?y ?x ?z))))

            (forall (?x ?z) (when (edge13 ?x ?z) 
                (and (not (edge13 ?x ?z)) (edge12 ?x ?z))))
            (forall (?y ?z) (when (edge34 ?y ?z) 
                (and (not (edge34 ?y ?z)) (edge13 ?y ?z))))
            (forall (?x ?z) (when (edge24 ?x ?z) 
                (and (not (edge24 ?x ?z)) (edge34 ?x ?z))))
            (forall (?y ?z) (when (edge12 ?y ?z) 
                (and (not (edge12 ?y ?z)) (edge24 ?y ?z))))

        )
    )

    (:action L2
    :effect
        (and
            (forall (?x ?y ?z) (when (cube1 ?x ?y ?z) (and (not (cube1 ?x ?y ?z)) (cube4 ?x ?y ?z))))
            (forall (?x ?y ?z) (when (cube3 ?x ?y ?z) (and (not (cube3 ?x ?y ?z)) (cube2 ?x ?y ?z))))
            (forall (?x ?y ?z) (when (cube4 ?x ?y ?z) (and (not (cube4 ?x ?y ?z)) (cube1 ?x ?y ?z))))
            (forall (?x ?y ?z) (when (cube2 ?x ?y ?z) (and (not (cube2 ?x ?y ?z)) (cube3 ?x ?y ?z))))

            (forall (?x ?z) (when (edge13 ?x ?z) (and (not (edge13 ?x ?z)) (edge24 ?x ?z))))
            (forall (?y ?z) (when (edge34 ?y ?z) (and (not (edge34 ?y ?z)) (edge12 ?y ?z))))
            (forall (?x ?z) (when (edge24 ?x ?z) (and (not (edge24 ?x ?z)) (edge13 ?x ?z))))
            (forall (?y ?z) (when (edge12 ?y ?z) (and (not (edge12 ?y ?z)) (edge34 ?y ?z))))

        )
    )

    (:action Lrev
    :effect
        (and
            (forall (?x ?y ?z) (when (cube1 ?x ?y ?z) (and (not (cube1 ?x ?y ?z)) (cube3 ?y ?x ?z))))
            (forall (?x ?y ?z) (when (cube3 ?x ?y ?z) (and (not (cube3 ?x ?y ?z)) (cube4 ?y ?x ?z))))
            (forall (?x ?y ?z) (when (cube4 ?x ?y ?z) (and (not (cube4 ?x ?y ?z)) (cube2 ?y ?x ?z))))
            (forall (?x ?y ?z) (when (cube2 ?x ?y ?z) (and (not (cube2 ?x ?y ?z)) (cube1 ?y ?x ?z))))

            (forall (?x ?z) (when (edge13 ?x ?z) (and (not (edge13 ?x ?z)) (edge34 ?x ?z))))
            (forall (?y ?z) (when (edge34 ?y ?z) (and (not (edge34 ?y ?z)) (edge24 ?y ?z))))
            (forall (?x ?z) (when (edge24 ?x ?z) (and (not (edge24 ?x ?z)) (edge12 ?x ?z))))
            (forall (?y ?z) (when (edge12 ?y ?z) (and (not (edge12 ?y ?z)) (edge13 ?y ?z))))

        )
    )

    (:action D
    :effect
        (and
            (forall (?x ?y ?z) (when (cube2 ?x ?y ?z) (and (not (cube2 ?x ?y ?z)) (cube6 ?x ?z ?y))))
            (forall (?x ?y ?z) (when (cube6 ?x ?y ?z) (and (not (cube6 ?x ?y ?z)) (cube8 ?x ?z ?y))))
            (forall (?x ?y ?z) (when (cube8 ?x ?y ?z) (and (not (cube8 ?x ?y ?z)) (cube4 ?x ?z ?y))))
            (forall (?x ?y ?z) (when (cube4 ?x ?y ?z) (and (not (cube4 ?x ?y ?z)) (cube2 ?x ?z ?y))))

            (forall (?x ?y) (when (edge26 ?x ?y) (and (not (edge26 ?x ?y)) (edge68 ?x ?y))))
            (forall (?x ?z) (when (edge68 ?x ?z) (and (not (edge68 ?x ?z)) (edge48 ?x ?z))))
            (forall (?x ?y) (when (edge48 ?x ?y) (and (not (edge48 ?x ?y)) (edge24 ?x ?y))))
            (forall (?x ?z) (when (edge24 ?x ?z) (and (not (edge24 ?x ?z)) (edge26 ?x ?z))))

        )
    )

    (:action D2
    :effect
        (and
            (forall (?x ?y ?z) (when (cube2 ?x ?y ?z) (and (not (cube2 ?x ?y ?z)) (cube8 ?x ?y ?z))))
            (forall (?x ?y ?z) (when (cube6 ?x ?y ?z) (and (not (cube6 ?x ?y ?z)) (cube4 ?x ?y ?z))))
            (forall (?x ?y ?z) (when (cube8 ?x ?y ?z) (and (not (cube8 ?x ?y ?z)) (cube2 ?x ?y ?z))))
            (forall (?x ?y ?z) (when (cube4 ?x ?y ?z) (and (not (cube4 ?x ?y ?z)) (cube6 ?x ?y ?z))))

            (forall (?x ?y) (when (edge26 ?x ?y) (and (not (edge26 ?x ?y)) (edge48 ?x ?y))))
            (forall (?x ?z) (when (edge68 ?x ?z) (and (not (edge68 ?x ?z)) (edge24 ?x ?z))))
            (forall (?x ?y) (when (edge48 ?x ?y) (and (not (edge48 ?x ?y)) (edge26 ?x ?y))))
            (forall (?x ?z) (when (edge24 ?x ?z) (and (not (edge24 ?x ?z)) (edge68 ?x ?z))))

        )
    )

    (:action Drev
    :effect
        (and
            (forall (?x ?y ?z) (when (cube2 ?x ?y ?z) (and (not (cube2 ?x ?y ?z)) (cube4 ?x ?z ?y))))
            (forall (?x ?y ?z) (when (cube4 ?x ?y ?z) (and (not (cube4 ?x ?y ?z)) (cube8 ?x ?z ?y))))
            (forall (?x ?y ?z) (when (cube8 ?x ?y ?z) (and (not (cube8 ?x ?y ?z)) (cube6 ?x ?z ?y))))
            (forall (?x ?y ?z) (when (cube6 ?x ?y ?z) (and (not (cube6 ?x ?y ?z)) (cube2 ?x ?z ?y))))

            (forall (?x ?y) (when (edge26 ?x ?y) (and (not (edge26 ?x ?y)) (edge24 ?x ?y))))
            (forall (?x ?z) (when (edge68 ?x ?z) (and (not (edge68 ?x ?z)) (edge26 ?x ?z))))
            (forall (?x ?y) (when (edge48 ?x ?y) (and (not (edge48 ?x ?y)) (edge68 ?x ?y))))
            (forall (?x ?z) (when (edge24 ?x ?z) (and (not (edge24 ?x ?z)) (edge48 ?x ?z))))
        )
    )

    (:action U
    :effect
        (and
            (forall (?x ?y ?z) (when (cube1 ?x ?y ?z) (and (not (cube1 ?x ?y ?z)) (cube3 ?x ?z ?y))))
            (forall (?x ?y ?z) (when (cube5 ?x ?y ?z) (and (not (cube5 ?x ?y ?z)) (cube1 ?x ?z ?y))))
            (forall (?x ?y ?z) (when (cube7 ?x ?y ?z) (and (not (cube7 ?x ?y ?z)) (cube5 ?x ?z ?y))))
            (forall (?x ?y ?z) (when (cube3 ?x ?y ?z) (and (not (cube3 ?x ?y ?z)) (cube7 ?x ?z ?y))))

            (forall (?x ?y) (when (edge15 ?x ?y) (and (not (edge15 ?x ?y)) (edge13 ?x ?y))))
            (forall (?x ?z) (when (edge57 ?x ?z) (and (not (edge57 ?x ?z)) (edge15 ?x ?z))))
            (forall (?x ?y) (when (edge37 ?x ?y) (and (not (edge37 ?x ?y)) (edge57 ?x ?y))))
            (forall (?x ?z) (when (edge13 ?x ?z) (and (not (edge13 ?x ?z)) (edge37 ?x ?z))))
        )
    )

    (:action U2
    :effect
        (and
            (forall (?x ?y ?z) (when (cube1 ?x ?y ?z) (and (not (cube1 ?x ?y ?z)) (cube7 ?x ?y ?z))))
            (forall (?x ?y ?z) (when (cube5 ?x ?y ?z) (and (not (cube5 ?x ?y ?z)) (cube3 ?x ?y ?z))))
            (forall (?x ?y ?z) (when (cube7 ?x ?y ?z) (and (not (cube7 ?x ?y ?z)) (cube1 ?x ?y ?z))))
            (forall (?x ?y ?z) (when (cube3 ?x ?y ?z) (and (not (cube3 ?x ?y ?z)) (cube5 ?x ?y ?z))))

            (forall (?x ?y) (when (edge15 ?x ?y) (and (not (edge15 ?x ?y)) (edge37 ?x ?y))))
            (forall (?x ?z) (when (edge57 ?x ?z) (and (not (edge57 ?x ?z)) (edge13 ?x ?z))))
            (forall (?x ?y) (when (edge37 ?x ?y) (and (not (edge37 ?x ?y)) (edge15 ?x ?y))))
            (forall (?x ?z) (when (edge13 ?x ?z) (and (not (edge13 ?x ?z)) (edge57 ?x ?z))))
        )
    )

    (:action Urev
    :effect
        (and
            (forall (?x ?y ?z) (when (cube1 ?x ?y ?z) (and (not (cube1 ?x ?y ?z)) (cube5 ?x ?z ?y))))
            (forall (?x ?y ?z) (when (cube5 ?x ?y ?z) (and (not (cube5 ?x ?y ?z)) (cube7 ?x ?z ?y))))
            (forall (?x ?y ?z) (when (cube7 ?x ?y ?z) (and (not (cube7 ?x ?y ?z)) (cube3 ?x ?z ?y))))
            (forall (?x ?y ?z) (when (cube3 ?x ?y ?z) (and (not (cube3 ?x ?y ?z)) (cube1 ?x ?z ?y))))

            (forall (?x ?y) (when (edge15 ?x ?y) (and (not (edge15 ?x ?y)) (edge57 ?x ?y))))
            (forall (?x ?z) (when (edge57 ?x ?z) (and (not (edge57 ?x ?z)) (edge37 ?x ?z))))
            (forall (?x ?y) (when (edge37 ?x ?y) (and (not (edge37 ?x ?y)) (edge13 ?x ?y))))
            (forall (?x ?z) (when (edge13 ?x ?z) (and (not (edge13 ?x ?z)) (edge15 ?x ?z))))
        )
    )

    (:action F
    :effect
        (and
            (forall (?x ?y ?z) (when (cube1 ?x ?y ?z) (and (not (cube1 ?x ?y ?z)) (cube5 ?z ?y ?x) )))
            (forall (?x ?y ?z) (when (cube5 ?x ?y ?z) (and (not (cube5 ?x ?y ?z)) (cube6 ?z ?y ?x) )))
            (forall (?x ?y ?z) (when (cube6 ?x ?y ?z) (and (not (cube6 ?x ?y ?z)) (cube2 ?z ?y ?x) )))
            (forall (?x ?y ?z) (when (cube2 ?x ?y ?z) (and (not (cube2 ?x ?y ?z)) (cube1 ?z ?y ?x) )))

            (forall (?x ?y) (when (edge15 ?x ?y) (and (not (edge15 ?x ?y)) (edge56 ?y ?x))))
            (forall (?y ?z) (when (edge56 ?y ?z) (and (not (edge56 ?y ?z)) (edge26 ?z ?y))))
            (forall (?x ?y) (when (edge26 ?x ?y) (and (not (edge26 ?x ?y)) (edge12 ?y ?x))))
            (forall (?y ?z) (when (edge12 ?y ?z) (and (not (edge12 ?y ?z)) (edge15 ?z ?y))))

        )
    )

    (:action F2
    :effect
        (and
            (forall (?x ?y ?z) (when (cube1 ?x ?y ?z) (and (not (cube1 ?x ?y ?z)) (cube6 ?x ?y ?z) )))
            (forall (?x ?y ?z) (when (cube5 ?x ?y ?z) (and (not (cube5 ?x ?y ?z)) (cube2 ?x ?y ?z) )))
            (forall (?x ?y ?z) (when (cube6 ?x ?y ?z) (and (not (cube6 ?x ?y ?z)) (cube1 ?x ?y ?z) )))
            (forall (?x ?y ?z) (when (cube2 ?x ?y ?z) (and (not (cube2 ?x ?y ?z)) (cube5 ?x ?y ?z) )))

            (forall (?x ?y) (when (edge15 ?x ?y) (and (not (edge15 ?x ?y)) (edge26 ?x ?y))))
            (forall (?y ?z) (when (edge56 ?y ?z) (and (not (edge56 ?y ?z)) (edge12 ?y ?z))))
            (forall (?x ?y) (when (edge26 ?x ?y) (and (not (edge26 ?x ?y)) (edge15 ?x ?y))))
            (forall (?y ?z) (when (edge12 ?y ?z) (and (not (edge12 ?y ?z)) (edge56 ?y ?z))))

        )
    )

    (:action Frev
    :effect
        (and
            (forall (?x ?y ?z) (when (cube1 ?x ?y ?z) (and (not (cube1 ?x ?y ?z)) (cube2 ?z ?y ?x) )))
            (forall (?x ?y ?z) (when (cube2 ?x ?y ?z) (and (not (cube2 ?x ?y ?z)) (cube6 ?z ?y ?x) )))
            (forall (?x ?y ?z) (when (cube6 ?x ?y ?z) (and (not (cube6 ?x ?y ?z)) (cube5 ?z ?y ?x) )))
            (forall (?x ?y ?z) (when (cube5 ?x ?y ?z) (and (not (cube5 ?x ?y ?z)) (cube1 ?z ?y ?x) )))

            (forall (?x ?y) (when (edge15 ?x ?y) (and (not (edge15 ?x ?y)) (edge12 ?y ?x))))
            (forall (?y ?z) (when (edge56 ?y ?z) (and (not (edge56 ?y ?z)) (edge15 ?z ?y))))
            (forall (?x ?y) (when (edge26 ?x ?y) (and (not (edge26 ?x ?y)) (edge56 ?y ?x))))
            (forall (?y ?z) (when (edge12 ?y ?z) (and (not (edge12 ?y ?z)) (edge26 ?z ?y))))

        )
    )

    (:action B
    :effect
        (and
            (forall (?x ?y ?z) (when (cube3 ?x ?y ?z) (and (not (cube3 ?x ?y ?z)) (cube4 ?z ?y ?x) )))
            (forall (?x ?y ?z) (when (cube7 ?x ?y ?z) (and (not (cube7 ?x ?y ?z)) (cube3 ?z ?y ?x) )))
            (forall (?x ?y ?z) (when (cube8 ?x ?y ?z) (and (not (cube8 ?x ?y ?z)) (cube7 ?z ?y ?x) )))
            (forall (?x ?y ?z) (when (cube4 ?x ?y ?z) (and (not (cube4 ?x ?y ?z)) (cube8 ?z ?y ?x) )))

            (forall (?x ?y) (when (edge37 ?x ?y) (and (not (edge37 ?x ?y)) (edge34 ?y ?x))))
            (forall (?y ?z) (when (edge78 ?y ?z) (and (not (edge78 ?y ?z)) (edge37 ?z ?y))))
            (forall (?x ?y) (when (edge48 ?x ?y) (and (not (edge48 ?x ?y)) (edge78 ?y ?x))))
            (forall (?y ?z) (when (edge34 ?y ?z) (and (not (edge34 ?y ?z)) (edge48 ?z ?y))))
        )
    )

    (:action B2
    :effect
        (and
            (forall (?x ?y ?z) (when (cube3 ?x ?y ?z) (and (not (cube3 ?x ?y ?z)) (cube8 ?x ?y ?z) )))
            (forall (?x ?y ?z) (when (cube7 ?x ?y ?z) (and (not (cube7 ?x ?y ?z)) (cube4 ?x ?y ?z) )))
            (forall (?x ?y ?z) (when (cube8 ?x ?y ?z) (and (not (cube8 ?x ?y ?z)) (cube3 ?x ?y ?z) )))
            (forall (?x ?y ?z) (when (cube4 ?x ?y ?z) (and (not (cube4 ?x ?y ?z)) (cube7 ?x ?y ?z) )))

            (forall (?x ?y) (when (edge37 ?x ?y) (and (not (edge37 ?x ?y)) (edge48 ?x ?y))))
            (forall (?y ?z) (when (edge78 ?y ?z) (and (not (edge78 ?y ?z)) (edge34 ?y ?z))))
            (forall (?x ?y) (when (edge48 ?x ?y) (and (not (edge48 ?x ?y)) (edge37 ?x ?y))))
            (forall (?y ?z) (when (edge34 ?y ?z) (and (not (edge34 ?y ?z)) (edge78 ?y ?z))))
        )
    )

    (:action Brev
    :effect
        (and
            (forall (?x ?y ?z) (when (cube3 ?x ?y ?z) (and (not (cube3 ?x ?y ?z)) (cube7 ?z ?y ?x) )))
            (forall (?x ?y ?z) (when (cube7 ?x ?y ?z) (and (not (cube7 ?x ?y ?z)) (cube8 ?z ?y ?x) )))
            (forall (?x ?y ?z) (when (cube8 ?x ?y ?z) (and (not (cube8 ?x ?y ?z)) (cube4 ?z ?y ?x) )))
            (forall (?x ?y ?z) (when (cube4 ?x ?y ?z) (and (not (cube4 ?x ?y ?z)) (cube3 ?z ?y ?x) )))

            (forall (?x ?y) (when (edge37 ?x ?y) (and (not (edge37 ?x ?y)) (edge78 ?y ?x))))
            (forall (?y ?z) (when (edge78 ?y ?z) (and (not (edge78 ?y ?z)) (edge48 ?z ?y))))
            (forall (?x ?y) (when (edge48 ?x ?y) (and (not (edge48 ?x ?y)) (edge34 ?y ?x))))
            (forall (?y ?z) (when (edge34 ?y ?z) (and (not (edge34 ?y ?z)) (edge37 ?z ?y))))
        )
    )

)