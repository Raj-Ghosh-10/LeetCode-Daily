(define/contract (num-sub s)
  (-> string? exact-integer?)
  (let ((tng (lambda (n)
               (/ (* n (+ n 1)) 2))))
    (foldl
     (lambda (ones acc)
       (modulo
        (+ acc (tng (string-length ones)))
        1000000007))
     0
     (string-split s "0"))))