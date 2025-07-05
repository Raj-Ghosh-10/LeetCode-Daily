(define/contract (find-lucky arr)
  (-> (listof exact-integer?) exact-integer?)
  
  (define (list_cycle:function arr:list:integer
                               current:integer
                               :counter
                               max:integer)

    (if (null? arr:list:integer)
        
        (if (= :counter
               current:integer)
            current:integer
            max:integer)

        (let
            ((car:integer
              (car arr:list:integer)))

          (cond

            ((> :counter
                current:integer)
             
             (let
                 ((dropped:list:integer
                   (dropf arr:list:integer
                          (#%plain-lambda (:integer)
                                          (= :integer
                                             current:integer)))))
               
               (if (null? dropped:list:integer)
                       
                   max:integer
                       
                   (list_cycle:function (cdr dropped:list:integer)
                                        (car dropped:list:integer)
                                        1
                                        max:integer))))
            
            ((= car:integer
                current:integer)
             (list_cycle:function (cdr arr:list:integer)
                                  current:integer
                                  (add1 :counter)
                                  max:integer))

            ((= :counter
                current:integer)
             (list_cycle:function (cdr arr:list:integer)
                                  car:integer
                                  1
                                  current:integer))

            (else
             (list_cycle:function (cdr arr:list:integer)
                                  car:integer
                                  1
                                  max:integer))))))
                
  (let
      ((sorted_arr:list
        (sort arr
              <)))
    
    (list_cycle:function (cdr sorted_arr:list)
                         (car sorted_arr:list)
                         1
                         -1)))