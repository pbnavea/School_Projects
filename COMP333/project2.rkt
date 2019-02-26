#lang racket
;Paula Navea
;COMP333
;Project 2
(define sqr(lambda (x) (* x x)))
; #1
(define distance (lambda (point1 point2) (
                                          sqrt( +
                                               (sqr( - (car point2) (car point1))) (sqr( - (car(cdr point2)) (car(cdr point1)))
                                                                                   )
                                               )
                                              )
                   )
  )

;#2
(define insert2 (lambda (y list) (cons (car list ) (cons y (cdr list) ) ))

  )

;3

(define findChar3 (lambda (z)
                    (if (> (string-length z)3)  (car(cdr(cdr (string->list z )))) ("Error"))

                   
                    )
 )

;4

(define insertLast2 (lambda (a list)
                      (reverse(cons (car(reverse list)) (cons a(cdr (reverse list)))))
                     )
  )

;5a
(define findNth(lambda (n list)
  (if (or (> n (length list)) (< n 0))
    (error "Index out of bounds.")
    (if (eq? n 0)
      (car list)
      (findNth (- n 1) (cdr list))))))