(define (is-power-of-three n)
  (and (> n 0)
       (= 0 (remainder (expt 3 19) n))))