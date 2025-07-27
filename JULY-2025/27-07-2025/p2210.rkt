(define/contract (count-hill-valley nums)
  (-> (listof exact-integer?) exact-integer?)
  (define (nums_cycle numbers
                      previous_number
                      up?
                      counter)
    [if (null? numbers)
        counter
        (let
            ([car!numbers
              (car numbers)])
          (cond
            [(= car!numbers
                previous_number)
             (nums_cycle (cdr numbers)
                         previous_number
                         up?
                         counter)]
            [(< car!numbers
                previous_number)
             [if up?
                 (nums_cycle (cdr numbers)
                             car!numbers
                             #f
                             (add1 counter))
                 (nums_cycle (cdr numbers)
                             car!numbers
                             #f
                             counter)]]
            [up?
             (nums_cycle (cdr numbers)
                         car!numbers
                         #t
                         counter)]
            [else
             (nums_cycle (cdr numbers)
                         car!numbers
                         #t
                         (add1 counter))]))])
  (let*
      ([car!nums
        (car nums)]
       [cdr!nums
        (dropf nums
               (#%plain-lambda (entry)
                               (= entry
                                  car!nums)))])
    [if (null? cdr!nums)
        0
        (let
            ([cadr!nums
              (car cdr!nums)])
        (nums_cycle (cdr cdr!nums)
                    cadr!nums
                    [if (> cadr!nums
                           car!nums)
                        #t
                        #f]
                    0))]))