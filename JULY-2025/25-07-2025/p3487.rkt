(define/contract (max-sum nums)
  (-> (listof exact-integer?) exact-integer?)
  (define (negative_cycle numbers
                          minimum_negative)
    [if (null? numbers)
        minimum_negative
        (let
            ([car!numbers
              (car numbers)])
          [if (positive? car!numbers)
                (let
                    ([set:numbers
                      (mutable-seteq car!numbers)])
                  (foldl (#%plain-lambda (number_entry result)
                                         [if (or (<= number_entry 0)
                                                 (set-member? set:numbers
                                                              number_entry))
                                             result
                                             (begin
                                               (set-add! set:numbers
                                                         number_entry)
                                               (+ number_entry
                                                  result))])
                         car!numbers
                         (cdr numbers)))
              (negative_cycle (cdr numbers)
                              (max minimum_negative
                                   car!numbers))])])

  (negative_cycle nums
                  -101))