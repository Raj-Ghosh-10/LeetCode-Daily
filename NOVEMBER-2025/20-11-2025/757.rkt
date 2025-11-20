(define/contract (intersection-size-two intervals)
  (-> (listof (listof exact-integer?)) exact-integer?)

  (let* (
         [sorted (sort intervals (λ (a b) (< (second a) (second b))))]
         [first-int (car sorted)]
         [prev1 (- (second first-int) 1)]
         [prev2 (second first-int)]
         [count 2])
    (define (process rest prev1 prev2 count)
      (if (null? rest)
          count
          (let* ([interval (car rest)]
                 [start (first interval)]
                 [end   (second interval)])
            
            (cond 
              [(< prev2 start)
               (process (cdr rest)
                        (- end 1)
                        end
                        (+ count 2))]

              [(< prev1 start)
               (define new-prev1
                 (if (= end prev2)
                     (- end 1)
                     end))

               (define-values (p1 p2)
                 (if (> new-prev1 prev2)
                     (values prev2 new-prev1)
                     (values new-prev1 prev2)))

               (process (cdr rest)
                        p1 p2
                        (+ count 1))]

              [else
               (process (cdr rest)
                        prev1 prev2
                        count)]))))
    
    (process (cdr sorted) prev1 prev2 count)))