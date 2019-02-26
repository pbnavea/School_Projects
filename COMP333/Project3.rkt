#lang racket
;Paula Navea
;COMP333
;Project3

;char<? to compare char

;a countChars function
(define countChars (lambda (lst) (length lst)))

;b countLines function
(define countLines(lambda (lst)
                    (cond
                      ((null? lst) 1)
                      ( (eqv? #\newline (car lst) ) (+ 1 (countLines(cdr lst))))
                      (else (countLines(cdr lst)))
                      )
                    )
  )
  
;c skipWS function
(define skipWS (lambda (list)
                    (if (null? list)
                        '()
                        (if (char-whitespace? (car list) )
                            (  skipWS (cdr list )  )
                            list 
                            )
                        )
                    )
 )

;d removeNextWord function
(define removeNextWord (lambda (list)
                         (if (null? (skipWS list)) ; if null print out list null
                             (list)
                             (if ( not (char-whitespace? (car  ( skipWS list) ) ) )
                                 (if ( not (char-whitespace? (car  ( cdr ( skipWS list) ) ) ) ) 
                                     ( removeNextWord (cdr (skipWS list) ) )
                                     (cdr list)
                                     )
                                 error
                                 )
                             )
                         )
  )

;e countWords function
(define countWords (lambda (lst)
                     (if (null? (skipWS lst))
                         0
                         (if (string? lst)
                             (countWords (string->list lst))
                             (if (not (char-whitespace? (car  ( skipWS lst) ) ) )
                                 (if (null? (cdr ( skipWS lst) ))
                                     1
                                     (if (not (char-whitespace? (car (cdr (skipWS lst)))))
                                         (countWords (cdr (skipWS lst)))
                                         (+ 1 (countWords (cdr ( skipWS lst))))))error))
                         )
                     )
  )
;f wc function
(define wc (lambda (str)
             (if  (string? str)
                  (wc (string->list str) )
                  (list  (countChars str)  (list  (countWords str) (countLines str) ) )
                  )
             )
  )

;Problem 2

;stringhashcode function
(define stringhashcode (lambda (str)
                         (foldl + 0 (map char->integer (string->list str) ))
                         )
  )
;allStrings? function
(define allStrings?
  (lambda (lst)
    (map string? lst)

  )
)
;hashlist function
(define hashlist (lambda (lst)
                   (if (memv #f (allStrings? lst))(displayln "ERROR")(map stringhashcode lst) 
                      )
                   )  
  )
(define InstructorsTestCase
  (lambda()
    (let ([testList (string->list "   red, green, pink, and blue.")])
      (begin
        ;-------Problem 1
        (displayln "Problem 1:")
        (display "a. countChars: ")  
        (displayln (countChars testList)) ; result:30 chars
        (display "b. countLines: ")
        (displayln  (countLines testList));result: 1 line
        (display "c. skipWS: ")
        (displayln (skipWS testList)) ;removes 3 whitespace in the beginning of the list
        (display "d. removeNextWord: ")
        (display (removeNextWord testList));removes "red"
        (displayln " ")
        (display"e. countWords: ")
        (displayln (countWords testList)); result 5 words
        (displayln " ")
        (displayln "f. Word Count")
        (displayln (wc "one "));result: 4 characters, 1 word, 1 line
        (displayln (wc " one or two??")) ;result: 13 characters, 3 words, 1 line
        (displayln (wc  "one  two"));result: 8 characters, 2 words, 1 line
        (displayln (wc  "A quick cat jumped \n over the fence \n and left." ));result: 47 characters, 9 words, 3 lines
    
        ;-------Problem 2
        (displayln "")
        (displayln"Problem 2: ")
        (displayln "")
        (displayln "a. stringhashcode")
        (displayln (stringhashcode  "abcdefgh5843"));result: 1016
        (displayln " ")
        (displayln "b. allStrings?")
        (displayln (allStrings? '("red"  "blue"  "green" ))) ; result: #t
        (displayln (allStrings? '(red blue green )));result: #f
        (displayln " ")
        (displayln "c. hashlist")
        (displayln (hashlist '( "abc" "2.34"  "qwerty line" "logic programmng in prolog"))); result: (294 199 1140 2578)
        (displayln  (hashlist '( "pairs"  "werty" 23)));result: ERROR

        ))))
