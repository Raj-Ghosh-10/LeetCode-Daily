(define/contract (maximum-gain s x y)
  (-> string? exact-integer? exact-integer? exact-integer?)
  
  (define (reverse-string str)
    (list->string (reverse (string->list str))))
  
  (let* ([s (if (< x y) (reverse-string s) s)]
         [x-points (max x y)]
         [y-points (min x y)]
         [a-count 0]
         [b-count 0]
         [total-points 0])
    
    (define (process-char c)
      (cond
        [(char=? c #\a) (set! a-count (add1 a-count))]
        [(char=? c #\b)
         (if (> a-count 0)
             (begin
               (set! a-count (sub1 a-count))
               (set! total-points (+ total-points x-points)))
             (set! b-count (add1 b-count)))]
        [else
         (let ([ba-points (* (min b-count a-count) y-points)])
           (set! total-points (+ total-points ba-points))
           (set! a-count 0)
           (set! b-count 0))]))
    
    (for-each process-char (string->list s))
    
    (set! total-points (+ total-points (* (min b-count a-count) y-points)))
    
    total-points))