(define/contract (possible-string-count 
word
[position
    (- (string-length word)
                      2)]
[previous_char
    (string-ref word
                (sub1 (string-length word)))]
[duplicate_count 1])
  (-> string? exact-integer?)
  [if (negative? position)
      duplicate_count
      (let
          ([ref!word
            (string-ref word
                        position)])
        [if (char=? ref!word
                    previous_char)
            (possible-string-count word
                                   (sub1 position)
                                   previous_char
                                   (add1 duplicate_count))
            (possible-string-count word
                                   (sub1 position)
                                   ref!word
                                   duplicate_count)])])