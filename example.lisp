;; Here's an example of usage of MT19937. It's pretty simple.

;; Load MT19937
(asdf:oos 'asdf:load-op :mt19937)

;; Make random numbers with your implementation's random
;; number generator.
(random 1234567)
(random 42.56)
(random 3.1415d0)

;; Make random numbers using MT19937
(mt19937:random 1234567)
(mt19937:random 42.56)
(mt19937:random 3.1415d0)

;; MT19937 has its own random state
(eq *random-state*
    mt19937:*random-state*)