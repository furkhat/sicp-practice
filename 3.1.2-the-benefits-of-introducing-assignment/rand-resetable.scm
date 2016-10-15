; It is useful to be able to reset a random-number generator to produce a sequence starting from a given value.
; Design a new rand procedure that is called with an argument that is either the symbol generate or the symbol reset and behaves as follows:
; (rand 'generate) produces a new random number; ((rand 'reset) <new-value>) resets the internal state variable to the designated <new-value>.
; Thus, by resetting the state, one can generate repeatable sequences. These are very handy to have when testing and debugging programs that use random numbers.



(define random-init 10)

(define rand
  (let ((x random-init))
    (define (generate)
      (set! x (rand-update x))
      x)
    (define (reset)
      (set! x random-init)
      x)
    (define (dispatch m)
      (cond ((eq? m 'generate)
             (generate))
            ((eq? m 'reset)
             (reset))))
    dispatch))

(define (rand-update x)
  (define m 1000)
  (define a 80)
  (define b 221)
  (remainder (+ (* a x)
                b)
             m))