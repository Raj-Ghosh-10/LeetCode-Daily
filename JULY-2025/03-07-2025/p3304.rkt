(define (no-of-one-bits n res)
  (if (= n 0)
      res
      (no-of-one-bits (quotient n 2) (+ res (remainder n 2)))))

(define (kth-character k)
  (integer->char (+ (char->integer #\a) (no-of-one-bits (- k 1) 0))))