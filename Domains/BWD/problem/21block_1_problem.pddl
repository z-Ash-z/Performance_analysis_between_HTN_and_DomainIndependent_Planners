(define (problem BW-rand-21)
    (:domain blocksworld)
    (:objects b1 b2 b3 b4 b5 b6 b7 b8 b9 b10 b11 b12 b13 b14 b15 b16 b17 b18 b19 b20 b21 )
    (:init
        (handempty)
        (on-table b1)
        (on b2 b17)
        (on b3 b10)
        (on b4 b3)
        (on b5 b13)
        (on b6 b8)
        (on-table b7)
        (on b8 b4)
        (on b9 b1)
        (on b10 b14)
        (on b11 b15)
        (on b12 b6)
        (on b13 b16)
        (on b14 b11)
        (on b15 b2)
        (on b16 b12)
        (on b17 b18)
        (on-table b18)
        (on b19 b5)
        (on b20 b9)
        (on b21 b20)
        (clear b7)
        (clear b19)
        (clear b21)
    )
    (:goal
        (and
            (on b1 b16)
            (on b2 b10)
            (on b3 b8)
            (on b4 b11)
            (on b5 b15)
            (on b6 b20)
            (on b7 b9)
            (on b8 b13)
            (on b9 b5)
            (on b10 b1)
            (on b11 b3)
            (on b13 b12)
            (on b14 b6)
            (on b16 b21)
            (on b18 b7)
            (on b19 b14)
            (on b21 b18)
        )
    )
)
