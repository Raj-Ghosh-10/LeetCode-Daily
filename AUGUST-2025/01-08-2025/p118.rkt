(define/contract (generate numRows)
  (-> exact-integer? (listof (listof exact-integer?)))
  (define (generate_row row_count
                        row_list
                        previous_row
                        trailing
                        current_row
                        increment_bool
                        mirror_counter_return
                        mirror_counter)
    (cond
      [(positive? mirror_counter)
       (let
           ([car!previous_row
             (car previous_row)])
         (generate_row row_count
                       row_list
                       (cdr previous_row)
                       car!previous_row
                       (cons (+ trailing
                                car!previous_row)
                             current_row)
                       increment_bool
                       mirror_counter_return
                       (sub1 mirror_counter)))]
      
      [increment_bool
       (let
           ([fold_cons_list
             (foldl cons
                    (cons (+ trailing
                             (car previous_row))
                          current_row)
                    current_row)]
            [mirror_counter_update
             (add1 mirror_counter_return)])
         [if (zero? row_count)
             (reverse (cons fold_cons_list
                            row_list))
             (generate_row (sub1 row_count)
                           (cons fold_cons_list
                                 row_list)
                           (cdr fold_cons_list)
                           (car fold_cons_list)
                           (list 1)
                           #f
                           mirror_counter_update
                           mirror_counter_update)])]
      [else
       (let
           ([fold_cons_list
             (foldl cons
                    current_row
                    current_row)])
         [if (zero? row_count)
             (reverse (cons fold_cons_list
                            row_list))
             (generate_row (sub1 row_count)
                           (cons fold_cons_list
                                 row_list)
                           (cdr fold_cons_list)
                           (car fold_cons_list)
                           (list 1)
                           #t
                           mirror_counter_return
                           mirror_counter_return)])]))

  [if (< numRows 3)
      [if (= numRows 1)
          (list (list 1))
          (list (list 1) (list 1 1))]
      (let
          ([list!1_1
            (list 1 1)])
        (generate_row (- numRows 3)
                      (list list!1_1 (list 1))
                      list!1_1
                      1
                      (list 1)
                      #t
                      0
                      0))])