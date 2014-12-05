; ================================================ 
;
; IAS, lab5
; Fri, 5.12.2014
;
; Author: ---- fill-in using format: xlogin00 ----
;
; ================================================

%include 'libs\utils.asm'
%include 'libs\checker.asm'

[section .data] 	; data segment definition

; Number sequence
%ifdef TEST
	A: 			db 	1, -2, 	\
				   	-3, 4
	B:			db 	1, 2, 3, 4 	\
		   			5, 6, 7, 8
	h:			db 	2		; height of A matrix
	w:			db	4		; width of B matrix
	n:			db	2		; width of A matrix, height of B matrix 
	
	; A * B = 	-9	-10	-11	-12
	;			 17	 18	 19	 20
	
	
	substr:		db "kujem", 0
	str:		db "kujem, kujem podkovicku, konikovi na nozicku. kujem, kujem vesele, zo zeleza ocele", 0
	
	results:	dd 4, 106, 32
 
%else
	;          THESE are data valid for normal run
	;           |
	;           v
	A: 			db 	1, 2, 	\
				   	3, 4
	B:			db 	1, 0, 	\
		   			0, 1
	h:			db 	2		; height of A matrix
	w:			db	4		; width of B matrix
	n:			db	2		; width of A matrix, height of B matrix 

	; A * B = 	1	0
	;			3	0


	substr:		db "ko", 0
	str:		db "kos kokosu"
	
	results:	dd 3, 10, 4

%endif

[section .bss] 	; bss (uninitialised data) segment definition
	buffer:     resb    64
	nSubstr:    resb    1
	C: 		   	resb    256

[section .text use32 class=CODE] 	; basis segment definition

_prologue                			; macro -- program initialisation

; --------------------------------------------------------------------------------------------
; Assignment:
; - tasks 1..2 in the source code below
; - (!) do not edit/remove lines with comment ;--- at their end
; 
; --------------------------------------------------------------------------------------------

task_1:							;---
; vytvorte program na najdenie vsetkych podretazcov 'substr'
; v retazci 'str'. Pozicie podretazcov ulozte do buffra 'buffer'
;
; Priklad
;	substr = "ma"
;	str = "mama ma emu"
;
;	nSubstr = 3
; 	buffer = 0, 2, 5
;
; pouzite subrutiny zapiste za navestie t1_routines
;
; (1.5 bodu)

 	; -- your code here ---




t1_check:						;---
	movzx EDX, byte [nSubstr]	;---
	_check 1					;---

; spocitajte sumu vsetkych hodnot v buffri 'buffer' a vysledok 
; ulozte do EDX. Pre priklad uvedeny vyssie plati; (suma) EDX = 7
 	
 	; -- your code here ---
 	
 	
 	
 	
	_check 2					;---
	jmp task_2					;---

t1_routines:					;---

	; -- your code here ---





; --------------------------------------------------------------------------------------------

task_2:
; vytvorte algoritmus pre vypocet nasobenia matic A * B = C. 
; - vyska matice A je v premennej 'h'
; - sirka matice B je v premennej 'w'
; - vyska matice B a sirka A je v premennej 'n' 
;
; Pre nazornu ukazku nasobenia matic je mozne pouzit kalkulator:
; http://matrix.reshish.com/multiplication.php
; 
; Vyslednu maticu C ukladajte do neinicializovanej oblasti s navestim 'C'
;
;
; pouzite subrutiny zapiste za navestie t2_routines
;
; (1.5 bodu)
;



t2_check:						;---
; spocitajte sumu vsetkych hodnot v matici C a vysledok 
; ulozte do EDX. 
;
; Pre riadny beh programu kde sa matica C rovna: 1 0 
; 											     3 0
; 
; je (suma) EDX = 4
; 
 	
 	; -- your code here ---
 	
 	
 	
 	
	_check 3					;---
	jmp epilogue				;---

t2_routines:					;---

	; -- your code here ---





; --------------------------------------------------------------------------------------------
epilogue:

_epilogue                			; macro -- program exit




