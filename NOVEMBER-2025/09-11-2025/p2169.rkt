(define (rec a b result)
    (cond
        ((or (= a 0) (= b 0)) result)
        ((> a b) (rec (- a b) b (+ 1 result)))
        (else (rec a (- b a) (+ 1 result)))
    )
)

(define/contract (count-operations num1 num2)
  (-> exact-integer? exact-integer? exact-integer?)
  (rec num1 num2 0)
  )