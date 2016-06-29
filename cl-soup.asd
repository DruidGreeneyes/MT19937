;; -*- Lisp -*-

(asdf:defsystem #:cl-soup
  :description "Portable MT19937 Mersenne Twister random number generator, renamed for ease of use."
  :author "Douglas T. Crosher and Raymond Toy"
  :licence "Public domain"
  :version "1.1" 
  :components ((:file "package")
               (:file "cl-soup")))
