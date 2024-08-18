; Leave the test outputs in.
; Name:- Darsh 

; Q1 (5 points)

(- 8 (- (* 3 5) 2)) ; expression of Q1.1
(+ (* (/ 8 4) (* 3 2)) (+ 8 (* 2 3))) ; expression of Q1.2
(+ 4 (* 8(- (+ 4 4) (* 3 (* 3 2))))) ; expression of Q1.3
(* (* (- 10 9) 2) (+ 2 (/ (+ (- 3 2) (* 3 9)) (+ 1 3)))) ; expression of Q1.4
(+ (+ 6 (* 2 (- (/ (+ (+ 1 (+ (* 6 2) 5) 8)) 2) 8))) (- (/ (+ (* 4 7) (* 2 4)) 4) (* 2 5))) ; expression of Q1.5

; Q2 Multiply (5 points)
(define (Multiply a b) ; calulate the product 
  (* a b))  ;display the result

(Multiply 5 2) ; function call

; Q3 Exponent (5 points)
(define (Exponent x n) ; exponential function 
  (if (= n 0) ; check if input is 0 or not
      1                         
      (Multiply x (Exponent x (- n 1))))) ; recursive call to the mutiply function according to the function 

(Exponent 4 3) ; function call

; Q4 (5 points)
(define (PerfectDivision x y) ; checking for perfect divisibility function 
  (if (not (= (remainder x y) 0)) ; logical statement  
      (display "This has a remainder") ; not divisble and leaves a remiander
       (/ x y))) ; perfectly divisble and does not leaves a remainder

(PerfectDivision 4 5) ; function call

(PerfectDivision 8 4) ; function call

; Q5 (5 points)
(define (MultiplyLet x y) ; let-expression to calculate product
  (let ((m1 x) (m2 y)) ; let expression
    (* m1 m2))) 

(MultiplyLet 6 9) ; function call 

; Q6 (5 points)
(define (Letexpression) ; let-expresion to calcluate an expression 
  (let ((eight 8) (three 3) (five 5) (two 2)) ; let expression according to the question 
    (- eight (- (* three five) 2))))

(Letexpression) ; function call 

; Q7 (5 points)
(define (accumulator x y total count) ; mutiplying a number by itself for certain number of times
  (if (= count y) ; base-case
      total ; after mutiplying the number
      (accumulator x y (+ total x) (+ count 1)))) ; recursive call 

(accumulator 3 4 0 0) ; function call 

;Q8 (3 points)
(define OR-GATE (lambda (a b) ; logical OR 
  (if (or (not (zero? a)) (not (zero? b))) ; logical statement for OR gate
      1
      0)))
            
(define AND-GATE (lambda (a b) ; logical AND
    (if (and (not (zero? a)) (not (zero? b))) ; logical statement for AND gate
       1
       0)))
              
(define NOT-GATE (lambda (a) ;logical NOT
       (if (zero? a) ; logical statement for NOT gate
           1
           0)))
               
; Test cases
(AND-GATE 0 0)
(AND-GATE 0 1)
(AND-GATE 1 0)
(AND-GATE 1 1)
;0
;0
;0
;1
(newline)
(OR-GATE 0 0)
(OR-GATE 0 1)
(OR-GATE 1 0)
(OR-GATE 1 1)
;0
;1
;1
;1
(newline)
(NOT-GATE 0)
(NOT-GATE 1)
;1
;0

;Q9 (3 points)
(define XOR-GATE (lambda (a b) ; logical XOR
  (OR-GATE (AND-GATE (NOT-GATE a) b) (AND-GATE a (NOT-GATE b))))) ; logical statemnt to build XOR using pre-defined logic gate functions

; Test cases
(newline)
(XOR-GATE 0 0)
(XOR-GATE 0 1)
(XOR-GATE 1 0)
(XOR-GATE 1 1)
;0
;1
;1
;0

;Q10
;Q10.1 (3 points)
(define halfAdder (lambda (x a b) ; half adder according to the question 
   (XOR-GATE (XOR-GATE a b) x)))
                  
;Q10.2 (3 points)
(define carry-out (lambda (x a b) ; carryout according to the question 
        (OR-GATE (AND-GATE a b) (AND-GATE (XOR-GATE a b) x)))) 
                  
;Q10.3 (3 points)
(define fullAdder (lambda (x a b) ; full adder according to the question 
        (cons (halfAdder x a b) (carry-out x a b)))) 
  
        
; Test cases
(newline)
(fullAdder 0 0 0) 	
(fullAdder 0 0 1) 	
(fullAdder 0 1 0) 	
(fullAdder 0 1 1)	
(fullAdder 1 0 0) 	
(fullAdder 1 0 1)	
(fullAdder 1 1 0) 	
(fullAdder 1 1 1) 
;(0 . 0)
;(1 . 0)
;(1 . 0)
;(0 . 1)
;(1 . 0)
;(0 . 1)
;(0 . 1)
;(1 . 1)

;;Q11
;;Q11.1 (5 points)
(define tail (lambda (lst) 
               (if (null? (cdr lst))
                   (car lst)
                   (tail (cdr lst)))))
;               
;;Q11.2 (5 points)
(define rmtail (lambda (lst) 
                 (if (null? (cdr lst))
                     '()
                     (cons (car lst) (rmtail (cdr lst))))))

(define fulladder (lambda (bitA bitB carryIn) 
                    (list sum carryOut)))

                
;;Q11.3 (15 points)
(define X1 '(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0) )	
(define X2 '(1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1) )	
(define X3 '(0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1) )	
(define X4 '(1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0) )
(define X5 '(0 1 0 1 0 1 0 1 0 1 0 1 0 1 1 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 1 1) )	
(define X6 '(1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 1 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 1) )
(define (n-bit-adder x y n) (recursiveAdd x y 0)) 

(define (recursiveAdd x y z) (if (null? x) 

        (list (list z))
                        
         (append (recursiveAdd (rmtail x) (rmtail y) 
         (cdr (fullAdder (tail x) (tail y) z)))
         (list (car(fullAdder (tail x) (tail y) z))))))
;
;;Test cases
;(newline)
;(n-bit-adder  X1 X2 32)
;(n-bit-adder  X3 X4 32)
;(n-bit-adder  X5 X6 32)
;(n-bit-adder  X2 X3 32)
;(n-bit-adder  X4 X5 32)
;(n-bit-adder  X1 X6 32)
;(newline)
;(n-bit-adder  X1 X3 32)
;(n-bit-adder  X1 X4 32)
;(n-bit-adder  X1 X5 32)
;(n-bit-adder  X2 X4 32)
;(n-bit-adder  X2 X5 32)
;(n-bit-adder  X2 X6 32)
;
;;((0) 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1)
;;((0) 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1)
;;((1) 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0)
;;((1) 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 0)
;;((1) 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1)
;;((0) 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 1 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 1)
;
;;((0) 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1)
;;((0) 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0)
;;((0) 0 1 0 1 0 1 0 1 0 1 0 1 0 1 1 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 1 1)
;;((1) 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 0 1)
;;((1) 0 1 0 1 0 1 0 1 0 1 0 1 0 1 1 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 1 0)
;;((1) 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 1 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0)
