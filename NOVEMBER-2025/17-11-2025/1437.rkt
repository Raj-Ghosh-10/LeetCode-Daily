(define/contract (k-length-apart nums k)
  (-> (listof exact-integer?) exact-integer? boolean?)
  (let loop ([lst nums] [prev -1] [i 0])
    (cond
      [(empty? lst) #t]
      [(= (first lst) 1)
       (cond
         [(and (not (= prev -1))
               (< (- i prev 1) k))
          #f]
         [else
          (loop (rest lst) i (add1 i))])]
      [else
       (loop (rest lst) prev (add1 i))])))