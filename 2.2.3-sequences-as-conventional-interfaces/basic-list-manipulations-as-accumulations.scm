(load "accumulate.scm")
(define (map p sequence)
  (accumulate (lambda (x y) (append (list (p x)) y)) '() sequence))
(define (append seq1 seq2)
  (accumulate cons seq2 seq1))
(define (length sequence)
  (accumulate (lambda (x y) (+ y 1)) 0 sequence))