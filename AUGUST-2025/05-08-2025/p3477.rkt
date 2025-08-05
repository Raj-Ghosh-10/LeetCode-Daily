(define/contract (num-of-unplaced-fruits fruits baskets)
  (-> (listof exact-integer?) (listof exact-integer?) exact-integer?)
  (define (baskets_cycle fruits
                         active_fruit
                         baskets
                         basket_storage
                         counter)
    (cond
      [(null? baskets)
       (drop>= fruits
               active_fruit
               basket_storage
               (add1 counter))]
      [(< (car baskets)
          active_fruit)
       (baskets_cycle fruits
                      active_fruit
                      (cdr baskets)
                      (cons (car baskets)
                            basket_storage)
                      counter)]
      [(null? fruits)
       counter]
      [(>= (car fruits)
           active_fruit)
       (baskets_cycle (cdr fruits)
                      (car fruits)
                      (cdr baskets)
                      basket_storage
                      counter)]
      [else
       (baskets_cycle (cdr fruits)
                      (car fruits)
                      (foldl cons
                             (cdr baskets)
                             basket_storage)
                      null
                      counter)]))

  (define (drop>= fruits
                  active_fruit
                  basket_storage
                  counter)
    (cond
      [(null? fruits)
       counter]
      [(>= (car fruits)
           active_fruit)
       (drop>= (cdr fruits)
               active_fruit
               basket_storage
               (add1 counter))]
      [else
       (baskets_cycle (cdr fruits)
                      (car fruits)
                      (reverse basket_storage)
                      null
                      counter)]))

  (baskets_cycle (cdr fruits)
                 (car fruits)
                 baskets
                 null
                 0))