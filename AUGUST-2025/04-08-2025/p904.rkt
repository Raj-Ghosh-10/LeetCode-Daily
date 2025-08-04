(define (total-fruit fruits)
  (let* ([V (list->vector fruits)]
         [mx 0]
         [addfruit
          (λ (d fr) (hash-update d fr (λ (val) (+ val 1)) 0))]
         [remfruit
          (λ (d fr) (if (= 1 (hash-ref d fr 0))
                        (hash-remove d fr)
                        (hash-update d fr (λ (val) (- val 1)) 0)))])
    (let loop ([left 0] [right 0] [cur (hash)])
      (cond ((> (hash-count cur) 2)
             (loop (add1 left) right (remfruit cur (vector-ref V left))))
            ((>= right (vector-length V)) (max mx (- right left)))
            (else
             (set! mx (max mx (- right left)))
             (loop left (add1 right) (addfruit cur (vector-ref V right))))))))