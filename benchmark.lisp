;; MT19937 benchmarking versus the RNG provided by the implementation.
;; As you can see, the standard RANDOM is much faster.

(defun test-mt19937-float ()
  (loop repeat 250000
	do (mt19937:random 1234.5678))
  (loop repeat 250000
	do (mt19937:random 1234.5678d0)))

(defun test-mt19937-integer ()
  (loop repeat 1000000
	do (mt19937:random 12345678)))

(defun test-cl-float ()
  (loop repeat 250000
	do (random 1234.5678))
  (loop repeat 250000
	do (random 1234.5678d0)))

(defun test-cl-integer ()
  (loop repeat 1000000
	do (random 12345678)))

(defun benchmark (&optional (stream *standard-output*))
  "Benchmark MT19937:random versus cl:random and print the
   results to STREAM (defaults to *standard-output*)"
  (let ((*trace-output* stream))
    (format stream "~&~%MT1997 integer test~%")
    (time (test-mt19937-integer))
    (format stream "~&~%Common Lisp integer test~%")
    (time (test-cl-integer))

    (format stream "~&~%~%MT1997 floating-point test~%")
    (time (test-mt19937-float))
    (format stream "~&~%Common Lisp floating-point test~%")
    (time (test-cl-float))))

