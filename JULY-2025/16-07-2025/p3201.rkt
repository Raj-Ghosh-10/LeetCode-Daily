(define/contract (maximum-length nums)
  (-> (listof exact-integer?) exact-integer?)
  (define (nums_scan numbers
                     even_pile
                     odd_pile
                     alternating_count
                     odd_switch)
    (cond
      [(null? numbers)
       (max even_pile
            odd_pile
            alternating_count)]
      [(even? (car numbers))
       [if odd_switch
           (nums_scan (cdr numbers)
                      (add1 even_pile)
                      odd_pile
                      (add1 alternating_count)
                      #f)
           (nums_scan (cdr numbers)
                      (add1 even_pile)
                      odd_pile
                      alternating_count
                      #f)]]
      [odd_switch
       (nums_scan (cdr numbers)
                  even_pile
                  (add1 odd_pile)
                  alternating_count
                  #t)]
      [else
       (nums_scan (cdr numbers)
                  even_pile
                  (add1 odd_pile)
                  (add1 alternating_count)
                  #t)]))

  [if (even? (car nums))
      (nums_scan (cdr nums)
                 1
                 0
                 1
                 #f)
      (nums_scan (cdr nums)
                 0
                 1
                 1
                 #t)])