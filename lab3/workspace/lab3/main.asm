; ================================================ 
;
; IAS, lab3 
; Fri, 21.11.2014
;
; Author: ---- fill-in using format: xlogin00 ----
;
; ================================================

%include 'libs\utils.asm'
%include 'libs\checker.asm'

[section .data] 	; data segment definition

; Number sequence
%ifdef TEST
	seq: 		db 25, 5, 15, 20, 25, 30, 25, 20, 15, 10, 5, 0, -5, -10, -15
	n:   		db 15
	nFib:		db 20
	results:	dd 1, 20, 25, 10945
%else
	;          THIS sequence is valid for normal run
	;           |
	;           v
	seq: 		db 3, 5, 10, 15, 18, 21, 33, 11, 45, 23
	n:   		db 10
	nFib:		db 10
	results:	dd 2, 62, 105, 88
%endif

sHelloMsg: 	db  "Hello World!",EOL,0

[section .text use32 class=CODE] 	; code segment definition

_prologue                			; macro -- program initialisation

; --------------------------------------------------------------------------------------------
; Zadanie:
; - body 1..4 v zdrojovom kode nizsie
; 
; --------------------------------------------------------------------------------------------

task_1:
; If first the number in the sequence 'seq' is smaller 
; than second, set EDX to 1, otherwise set EDX to 2
;
; Example1: seq: db 1, 2, ..
;           ...
;           result: EDX = 1
;
; Example2: seq: db 3, 3, ..
;           ...
;           result: EDX = 2
;
; (0.5 point)
;
	mov AL, [seq]
	cmp AL, [seq+1]
	jg t1_bigger
t1_smaller:	  		
	mov EDX, 2
	jmp t1_end
t1_bigger:	  	
	mov EDX, 1
t1_end:


	_check_task 1
;---------------------------------------------------------------------------------

task_2:
; Calculate the sum of all elements from the sequence 
; seq smaller than 20. Number of all elements is in 
; variable 'n'
; 
; Example: seq: db 10, 15, 20, 25
;		   n:	db 4
;          ...
;          result: EDX = 25
;
; (1.5 points)
;
	movzx ECX, byte [n]
	mov EBX, seq
	xor EDX, EDX
t2_loop:
	movsx EAX, byte [EBX]
	cmp EAX, 20
	jge	t2_end_if
t2_then:
	add EDX, EAX
t2_end_if:
	inc EBX
	loop t2_loop


	_check_task 2
;---------------------------------------------------------------------------------

  
task_3:
; Calculate sum of all elements in the sequence seq
; from the first element up until the point where
; next element is greater than actual. Save result into 
; the EDX register. Number of all elements is in variable 'n'
;
; Example: seq: db 1, 2, 3, 2
;          ...
;          result: EDX = 6     
;    
; (0.5 point)
;
	movzx ECX, byte [n]
	mov EBX, seq
	xor EDX, EDX
	xor EAX, EAX
t3_loop:
	mov AL, byte [EBX]
	cmp AL, byte [EBX+1]
	jge	t3_end
t3_then:
	add EDX, EAX
t3_end_if:
	inc EBX
	loop t3_loop
t3_end:
	add EDX, EAX

	_check_task 3
;---------------------------------------------------------------------------------   

task_4:
; Calculate sum of first 'nFib' members of Fibbonachi 
; series and store result in the EDX register 
;
; Fibbonachi series is: 0, 1, 1, 2, 3, 5, 8 ...
;           definition: F(n)=F(n-1)+F(n-2) for n>=2
;                       F(0) = 0
;                       F(1) = 1
;
; Example: nFib = 5
;          ...
;          result: EDX = 7  
;
; (0.5 points)
;
	movzx ECX, byte [nFib]
	mov EDX, 0    ; 1.member of fib.series
	mov EAX, 1    ; 2.member of fib.series 
	xor EBX, EBX
t4_loop:
	add EBX, EDX	; lets make a sum
	add EDX, EAX	; compute next member of fib.series
	xchg EDX, EAX	; and store it in EAX
	loop t4_loop
	
	mov EDX, EBX	; store the result in the right register


	_check_task 4
;---------------------------------------------------------------------------------  

_epilogue                			; macro -- program exit




