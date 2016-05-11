(defmacro run-section [header body footer]
  `(do (print ~header) ; this line does not affect the result
       ~body
       (print ~footer)))


(defn foo []
  (run-section "The Header"
               (print "Do something useful here")
               "TheFooter")

  (/ 1 0))

(foo)
