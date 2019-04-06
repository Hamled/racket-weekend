#lang racket

(define louis
  '("l" "ou" "i" "s"))

(match louis
  [(? string?)
   "no way Jose"]
  [(list "l")
   "list contains more than that"]
  [(list-rest "l" "o" more)
   "close, but not quite"]
  [(list-rest "l" (pregexp "o[a-z]") more)
   (displayln
     (format "the second element of the list is: ~a, and more is ~a"
             (second louis)
             more))
   more]
  [else
    "ouch!"])
