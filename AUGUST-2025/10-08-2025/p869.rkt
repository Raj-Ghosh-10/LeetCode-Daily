(define/contract (reordered-power-of2 n)
  (-> exact-integer? boolean?)
  (let* ([alph
          (λ (s)
            (apply string (sort (string->list s) char<?)))]
         [cands
          (cons (number->string 1)
                (let loop ([n 1])
                  (if (>= n (expt 10 10))
                      '()
                      (cons (alph (number->string (* n 2)))
                            (loop (* n 2))))))])
    (if (member (alph (number->string n))
                cands)
        #t
        #f)))