#lang racket

(define/contract (f x)
  (exact-integer? . -> . exact-integer?)
  (* x (add1 x)))

(define (infinite? n)
  (or (= +inf.0)
      (= +inf.f)
      (= -inf.0)
      (= -inf.f)))

(define/contract (cool x y)
  (real? real? . -> . (or/c exact-integer?
                            infinite?))
  (define m (max (ceiling x) (ceiling y)))
  (if (infinite? m)
      m
      (f (inexact->exact m))))
