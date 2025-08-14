(require racket/fixnum)
(define/contract (largest-good-integer num)
  (-> string? string?)
  (define (no_triplet num
                      position
                      previous_char
                      counter)
                               
    [if (negative? position)
        ""
        (let
            ([ref!num
              (string-ref num
                          position)])
          (cond
            [(not (char=? ref!num
                          previous_char))
             (no_triplet num
                         (fx- position
                              1)
                         ref!num
                         0)]
            [(fx= counter
                  1)
             (some_triplet num
                           (fx- position
                                1)
                           #\0
                           previous_char
                           0)]
            [else
             (no_triplet num
                         (fx- position
                              1)
                         previous_char
                         1)]))])

  (define (some_triplet num
                        position
                        previous_char
                        triplet_char
                        counter)
    [if (negative? position)
        (make-string 3
                     triplet_char)
        (let
            ([ref!num
              (string-ref num
                          position)])
          (cond
            [(char<=? ref!num
                      triplet_char)
             (some_triplet num
                           (fx- position
                                1)
                           #\0
                           triplet_char
                           0)]
            [(char=? ref!num
                     previous_char)
             [if (fx= counter
                      1)
                 (some_triplet num
                               (fx- position
                                    1)
                               #\0
                               ref!num
                               0)
                 (some_triplet num
                               (fx- position
                                    1)
                               ref!num
                               triplet_char
                               1)]]
            [else
             (some_triplet num
                           (fx- position
                                1)
                           ref!num
                           triplet_char
                           0)]))])
  (let
      ([num_length
        (fx- (string-length num)
             1)])
    (no_triplet num
                num_length
                #\0
                0)))