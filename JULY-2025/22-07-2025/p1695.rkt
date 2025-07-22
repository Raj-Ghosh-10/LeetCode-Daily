(define/contract (maximum-unique-subarray nums)
  (-> (listof exact-integer?) exact-integer?)
  (let* ([V (list->vector nums)]
         [N (vector-length V)])
    (let loop ([left 0] [right 0] [cur 0] [mx 0] [contents (set)])
      (if (= right N)
          mx
          (let ([valr (vector-ref V right)]
                [vall (vector-ref V left)])
            (if (set-member? contents valr)
                (loop (add1 left)
                     right
                     (- cur vall)
                     mx
                     (set-remove contents vall))
                (loop left
                      (add1 right)
                      (+ cur valr)
                      (max mx (+ cur valr))
                      (set-add contents valr))))))))