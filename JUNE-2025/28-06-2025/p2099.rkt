(define/contract (max-subsequence nums k)
  (-> (listof exact-integer?) exact-integer? (listof exact-integer?))
  (define (fill_set sorted_nums
                    count
                    max_hash)
    [if (zero? count)
        (fill_output nums
                     k
                     max_hash
                     null)
        (let
            ([car!sorted_nums
              (car sorted_nums)])
          (begin
            (hash-set! max_hash
                       car!sorted_nums
                       (add1 (hash-ref max_hash
                                       car!sorted_nums
                                       0)))
                     
            (fill_set (cdr sorted_nums)
                      (sub1 count)
                      max_hash)))])

  (define (fill_output nums
                       k
                       max_hash
                       output)
    [if (zero? k)
        (reverse output)
        (let*
            ([car!nums
              (car nums)]
             [ref!max_hash
              (hash-ref max_hash
                        car!nums
                        0)])
          [if (positive? ref!max_hash)
              (begin
                (hash-set! max_hash
                           car!nums
                           (sub1 ref!max_hash))
                (fill_output (cdr nums)
                             (sub1 k)
                             max_hash
                             (cons car!nums
                                   output)))
              (fill_output (cdr nums)
                           k
                           max_hash
                           output)])])

  (fill_set (sort nums
                  >)
            k
            (make-hasheq)))