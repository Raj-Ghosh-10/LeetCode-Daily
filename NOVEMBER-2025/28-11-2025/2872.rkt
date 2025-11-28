(define/contract (max-k-divisible-components n edges values k)
  (-> exact-integer? (listof (listof exact-integer?)) (listof exact-integer?) exact-integer? exact-integer?)
  (let* ((g (make-vector n '()))
         (ans (box 0)))
    
    ;; build adjacency list
    (for ([e edges])
      (let ([a (first e)]
            [b (second e)])
        (vector-set! g a (cons b (vector-ref g a)))
        (vector-set! g b (cons a (vector-ref g b)))))
    
    ;; define recursive DFS
    (define (dfs u p)
      (let ([sum (list-ref values u)])
        (for ([v (in-list (vector-ref g u))])
          (unless (= v p)
            (set! sum (+ sum (dfs v u)))))
        (if (= (modulo sum k) 0)
            (begin
              (set-box! ans (+ (unbox ans) 1))
              0)
            sum)))
    
    (dfs 0 -1)
    (unbox ans)))