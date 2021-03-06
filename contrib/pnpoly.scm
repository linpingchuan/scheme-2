(define pt-in-poly
  (lambda (npol xp yp x y)
    (let ((c #f)
          (j (- npol 1)))
      (do ((i 0 (+ i 1)))
          ((= i npol) c)
        (if (and (or (and (<= (vector-ref yp i) y) (< y (vector-ref yp j)))
                     (and (<= (vector-ref yp j) y) (< y (vector-ref yp i))))
                 (< x (+ (vector-ref xp i)
                         (/ (* (- (vector-ref xp j) (vector-ref xp i)) (- y (vector-ref yp i)))
                            (- (vector-ref yp j) (vector-ref yp i))))))
            (set! c (not c)))
        (set! j i))
      )))

(define pnpolytest
  (lambda ()
    (let ((npol 20)
          (count 0)
 ;         (_xp '#(0.0 1.0 1.0 0.0 0.0 1.0 -.5 -1.0 -1.0 -2.0 -2.5 -2.0 -1.5 -.5 1.0 1.0 0.0 -.5 -1.0 -.5))
 ;         (_yp '#(0.0 0.0 1.0 1.0 2.0 3.0 2.0 3.0 0.0 -.5 -1.0 -1.5 -2.0 -2.0 -1.5 -1.0 -.5 -1.0 -1.0 -.5))
          (xp (apply vector '(0.0 1.0 1.0 0.0 0.0 1.0 -.5 -1.0 -1.0 -2.0 -2.5 -2.0 -1.5 -.5 1.0 1.0 0.0 -.5 -1.0 -.5)))
          (yp (apply vector '(0.0 0.0 1.0 1.0 2.0 3.0 2.0 3.0 0.0 -.5 -1.0 -1.5 -2.0 -2.0 -1.5 -1.0 -.5 -1.0 -1.0 -.5)))
		  )
      (do ((i 0 (+ i 1)))
          ((= i 100000))
        (if (pt-in-poly npol xp yp 0.5 0.5) (set! count (+ count 1)))
        (if (pt-in-poly npol xp yp 0.5 1.5) (set! count (+ count 1)))
        (if (pt-in-poly npol xp yp -.5 1.5) (set! count (+ count 1)))
        (if (pt-in-poly npol xp yp .75 2.25) (set! count (+ count 1)))
        (if (pt-in-poly npol xp yp 0.0 2.01) (set! count (+ count 1)))
        (if (pt-in-poly npol xp yp -.5 2.5) (set! count (+ count 1)))
        (if (pt-in-poly npol xp yp -1.0 -.5) (set! count (+ count 1)))
        (if (pt-in-poly npol xp yp -1.5 .5) (set! count (+ count 1)))
        (if (pt-in-poly npol xp yp -2.25 -1.0) (set! count (+ count 1)))
        (if (pt-in-poly npol xp yp .5 -.25) (set! count (+ count 1)))
        (if (pt-in-poly npol xp yp .5 -1.25) (set! count (+ count 1)))
        (if (pt-in-poly npol xp yp -.5 -2.5) (set! count (+ count 1)))
        )
      (display "count ") (write count) (newline)
      count
      )))

(pnpolytest)
