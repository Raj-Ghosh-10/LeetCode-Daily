(define/contract (prefixes-div-by5 nums)
  (-> (listof exact-integer?) (listof boolean?))
  (let loop ((lst nums) (mod 0) (acc '()))
    (cond
      [(null? lst) (reverse acc)]
      [else
       (define new-mod (modulo (+ (* mod 2) (car lst)) 5))
       (loop (cdr lst) new-mod (cons (= new-mod 0) acc))])))