#lang racket

(define location%
  (class object%
    (init aisle
          section
          shelf)
    (define $aisle aisle)
    (define $section section)
    (define $shelf shelf)
    (super-new)
    (define/public (as-string)
      (format "~a-~a-~a"
              $aisle
              $section
              $shelf))
    (define/public (get-aisle)
      $aisle)))

(define super-shoes-loc
  (new location%
       [aisle 13]
       [section "B"]
       [shelf 5]))

;(send super-shoes-loc as-string)

(define bin%
  (class object%
    (init location
          product
          qty
          pickable?)
    (define $location location)
    (define $product product)
    (define $qty qty)
    (define $pickable? pickable?)
    (super-new)
    (define/public (is-available?)
      (and $pickable?
           (> $qty 0)))
    (define/public (pick!)
      (unless (is-available?)
        (error
          (format "Cannot pick ~a from bin ~a."
                  $qty
                  (send $location as-string))))
      (set! $qty (sub1 $qty)))
    (define/public (get-aisle)
      (send $location get-aisle))
    (define/public (get-qty)
      $qty)
    (define/public (make-unpickable!)
      (set! $pickable? #f))))

(define super-shoes-bin
  (new bin%
       [location super-shoes-loc]
       [product "Super Shoes"]
       [qty 2]
       [pickable? #t]))

(begin
  (displayln (format "Super shoes are in aisle ~a" (send super-shoes-bin get-aisle)))
  (displayln (format "We currently have ~a Super shoes in stock" (send super-shoes-bin get-qty)))
  (displayln "Picking one pair of Super shoes")
  (send super-shoes-bin pick!)
  (displayln (format "We currently have ~a Super shoes in stock" (send super-shoes-bin get-qty)))
  (displayln "Making Super shoes unpickable")
  (send super-shoes-bin make-unpickable!)
  (displayln "Picking one pair of Super shoes")
  (send super-shoes-bin pick!)
  (displayln (format "We currently have ~a Super shoes in stock" (send super-shoes-bin get-qty))))
