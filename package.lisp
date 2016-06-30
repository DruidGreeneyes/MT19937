(defpackage #:mt19937
  (:use :common-lisp)
  (:shadow #:random-state
           #:random-state-p
           #:random
           #:*random-state*
           #:make-random-state)
  (:export #:random-state
           #:random-state-p
           #:random
           #:*random-state*
           #:make-random-state
           #:seed-random-state
           #:%random-single-float
           #:%random-double-float
           #:random-chunk
           #:init-random-state))
