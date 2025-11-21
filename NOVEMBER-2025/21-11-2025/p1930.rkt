(define (count-palindromic-subsequence s)
  (let* ([n (string-length s)]
         [first (make-vector 26 -1)]
         [last  (make-vector 26 -1)])

    ;; Track first/last occurrence
    (for ([i (in-range n)])
      (define c (- (char->integer (string-ref s i)) (char->integer #\a)))
      (when (= (vector-ref first c) -1)
        (vector-set! first c i))
      (vector-set! last c i))

    ;; Count palindromic subsequences
    (for/sum ([c (in-range 26)])
      (define f (vector-ref first c))
      (define l (vector-ref last c))
      (if (or (= f -1) (<= (- l f) 1))
          0
          (let ([seen (make-hash)])
            (for ([i (in-range (add1 f) l)])
              (hash-set! seen (string-ref s i) #t))
            (hash-count seen))))))