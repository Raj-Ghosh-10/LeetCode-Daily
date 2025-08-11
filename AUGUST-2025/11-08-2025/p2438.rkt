(define/contract (product-queries n queries)
  (-> exact-integer? (listof (listof exact-integer?)) (listof exact-integer?))
  (define power_vector #(536870912
                         268435456
                         134217728
                         67108864
                         33554432
                         16777216
                         8388608
                         4194304
                         2097152
                         1048576
                         524288
                         262144
                         131072
                         65536
                         32768
                         16384
                         8192
                         4096
                         2048
                         1024
                         512
                         256
                         128
                         64
                         32
                         16
                         8
                         4
                         2
                         1))

  (define n_string (number->string n
                                   2))
  (define use_string (string-append
                      (make-string (- 30
                                      (string-length n_string))
                                   #\0)
                      n_string))
  
  (define (power_list_generator power_vector
                                use_string
                                position
                                power_list)
    [if (= position 30)
        power_list
        (power_list_generator power_vector
                              use_string
                              (add1 position)
                              [if (char=? (string-ref use_string
                                                      position)
                                          #\1)
                                  (cons (vector-ref power_vector
                                                    position)
                                        power_list)
                                  power_list])])

  (define power_list
    (power_list_generator power_vector
                          use_string
                          (- 30
                             (string-length n_string))
                          null))


  (define (generator_hub reverse_queries
                         output)
    [if (null? reverse_queries)
        output
        (let
            ([car!reverse_queries
              (car reverse_queries)])
          (generator_hub (cdr reverse_queries)
                         (cons (obtain_position power_list
                                                0
                                                (car car!reverse_queries)
                                                (cadr car!reverse_queries))
                               output)))])

  (define (obtain_position power_list
                           position
                           left_pointer
                           right_pointer)
    [if (= position
           left_pointer)
        (obtain_product power_list
                        left_pointer
                        right_pointer
                        1)
        (obtain_position (cdr power_list)
                         (add1 position)
                         left_pointer
                         right_pointer)])

  (define (obtain_product power_list
                          left_pointer
                          right_pointer
                          accumulator)
    (cond              
      [(> left_pointer
          right_pointer)
       [if (> accumulator
              1000000007)
           (modulo accumulator
                   1000000007)
           accumulator]]
      [(>= accumulator
           1000000007)
       (obtain_product (cdr power_list)
                       (add1 left_pointer)
                       right_pointer
                       (* (modulo accumulator
                                  1000000007)
                          (car power_list)))]
      [else
       (obtain_product (cdr power_list)
                       (add1 left_pointer)
                       right_pointer
                       (* accumulator
                          (car power_list)))]))

  (generator_hub (reverse queries)
                 null))