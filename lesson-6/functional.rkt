#lang racket
(require (file "../lesson-3/warehouse.rkt"))

(define/contract (cube x)
  (-> number? number?)
  (* x x x))

(define/contract l
  (listof number?)
  (list 4 -9 45.132 45-2i))

(define/contract hamlet
  string?
  "To be or not to be, that is the question.")

(define/contract (capitalize str)
  (-> string? string?)
  (cond ((string=? str "")
         "")
        (else
          (define c (string-ref str 0))
          (format "~a~a"
                  (char-upcase c)
                  (substring str 1)))))

(define/contract (square-sum x y)
  (-> number? number? number?)
  (expt (+ x y) 2))

(define (imaginary? n)
  (and (number? n)
       (not (real? n))))

(define/contract (talk-about-cubes nums)
  (-> (listof number?) void?)
  (for ([n nums])
    (displayln (format "The cube of ~a is ~a."
                       n
                       (cube n)))))

(define (set-qty-for-bins! bins qtys)
  (for ([b bins]
        [q qtys])
    (set-bin-qty! b q)))
