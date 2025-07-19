(define (remove-subfolders folder)
  (let loop ([folder (sort folder string<?)])
    (cond [(empty? folder) '()]
          [else
             (let* ([parent (first folder)]
                    [parent-dir (string-append parent "/")])
                (cons parent
                      (loop (dropf (rest folder) (curryr string-prefix? parent-dir)))))])))