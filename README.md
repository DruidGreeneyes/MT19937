# cl-soup
This is a fork of the CL implementation of MT19937 Mersenne Twister. I don't own it and claim no credit. It's here because it was impossible to find. (It's on quicklisp and quickdocs, but the only way to get at the source was to install it via quicklisp and open up the resultant zip file). I renamed the package to 'soup' because while MT19937 is accurate, it's a bear to type. I also added a seed function, because the original was not concise and not exported. I don't claim mine is better, I just wanted an easier way to access it. Don't like it? Great, write a better one and do a pull request, or however this github thingy is supposed to work.

You can access functions just as in the original, except the package is now called 'soup'. Also there's a new seed function:

```common-lisp
(let ((test-state (soup:seed-random-state "OMGWTFBBQ!?")))
  (soup:random 1000 test-state))
  
=> 204

(let ((test-state (soup:seed-random-state "WHY DO YOU KEEP DOING THIS TO ME!?")))
  (loop for i from 0 below 12 collect (soup:random 1000 test-state)))
 
 => (990 699 689 393 245 303 320 872 244 257 166 256)
```

Here follows the original readme.

Introduction
============

MT19937 is a portable Mersenne Twister random number generator. It
is mainly a modification of CMUCL's random number generator with all
the CMUCL-specific parts taken out.

It is faster than the JMT Mersenne Twister implementation, but
significantly slower than native random number generators provided by
major Common Lisp implementations. For light use this shouldn't be a
problem, since it is still very fast.

It should be very stable, since it's based on stable CMUCL code. It
has been tested on CMUCL, SBCL, LispWorks, Allegro CL, GCL, CLISP, and
Corman Lisp.

What's the point?
=================

Why, you might ask, would you want to use a portable, slower random
number generator? The answer is consistancy. The portable version of
this code was originally created for Maxima, a computer algebra
system. They wanted the results of the random number generator to be
portable across several implementations and platforms, so that if you
used a certain seed on CMUCL the numbers generated would be the same
as you would get with the same seed on GCL or CLISP. This was more
important than achieving the maximum possible speed. You may have
similar problems.

Usage
=====

MT19937 is a plug-in replacement for the Common Lisp random-number
generator. The MT19937 package exports all the Common Lisp symbols
related to random number generation, so you just need to load MT19937
and call its functions instead of the built-in ones. For example:

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
    mt19937:*random-state*)  => nil


License
=======

MT19937 is in the public domain.
