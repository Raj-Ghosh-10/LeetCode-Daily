(define/contract (min-operations nums k)
  (-> (listof exact-integer?) exact-integer? exact-integer?)
  (remainder (apply + nums) k))