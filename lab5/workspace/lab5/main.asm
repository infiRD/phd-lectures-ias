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
	substr:		db "kujem", 0
	
	str1:		db "podkovicku konikovi", 0
	str2:		db "podkovicku kujem", 0
	str3:		db "kujem podkovicku", 0
	strAll:		db "kujem, kujem podkovicku, konikovi na nozicku. kujem vesele, zo zeleza ocele", 0
	
	results:	dd -1, 11, 0, 19, 16, 16, 3
 
%else
	;          THESE are data valid for normal run
	;           |
	;           v
	substr:		db "ko", 0
	str1:		db "kos kokosov", 0
	str2:		db "asko", 0
	str3:		db "lopata", 0
	strAll:		db "nakosil som plny kos kokosov"
	
	results:	dd 0, 2, -1, 11, 4, 6, 4

%endif


[section .bss] 	; bss (uninitialised data) segment definition
	buffer:     resb    64
	nSubstr:    resb    1

[section .text use32 class=CODE] 	; basis segment definition

_prologue                			; macro -- program initialisation

; --------------------------------------------------------------------------------------------
; Assignment:
; - tasks 1..2 in the source code below
; - (!) do not edit/remove lines with comment ;--- at their end
; 
; --------------------------------------------------------------------------------------------

task_1:							;---
; vytvorte rutinu 'findstr' na najdenie podretazca (substr) v retazci (str). 
; Volba registrov a predavania parametrov je na vas. Odporucam 
; pouzit registre ESI a EDI na prenesenie offsetov k retazcom. Rutina 
; by mala vratit -1 ak sa v retazci podretazec nenachadza. 
;
; Priklad 1:
;	substr = "ma"
;	str = "mama ma emu"
;	navratova hodnota = 0 	
;
; Priklad 2:
;	substr = "ma"
;	str = "emu ma"
;	navratova hodnota = 4 	
; 
; Priklad 3:
;	substr = "ma"
;	str = "emu"
;	navratova hodnota = -1 	
;
; (2 body)

t1_check:						;---
; zavolajte subrutinu findstr pre podretazec substr a retazec str1
; navratovu hodnotu ulozte do registra EDX 
	
	 ; -- your code here ---
	
	_check 1					;---

; zavolajte subrutinu findstr pre podretazec substr a retazec str2
; navratovu hodnotu ulozte do registra EDX 
	
	 ; -- your code here ---
	
	_check 2					;---
	
; zavolajte subrutinu findstr pre podretazec substr a retazec str3
; navratovu hodnotu ulozte do registra EDX 
	
	 ; -- your code here ---
	
	_check 3					;---	
 	
 	jmp task_2					;---



findstr:						;---

	; -- your code here ---
	

; --------------------------------------------------------------------------------------------

task_2:
; vytvorte funkciu strlen, ktora vrati dlzku retazca. Predavanie parametrov
; si zvolte sami
;
; (0.5 bodu)

t2_check:
; zavolajte subrutinu strlen pre retazec str1
; navratovu hodnotu ulozte do registra EDX

	; -- your code here ---
 	
	_check 4					;---
	
; zavolajte subrutinu strlen pre retazec str2
; navratovu hodnotu ulozte do registra EDX

	; -- your code here ---
 	
	_check 5					;---
	
; zavolajte subrutinu strlen pre retazec str3
; navratovu hodnotu ulozte do registra EDX

	; -- your code here ---
 	
	_check 6					;---
	
	
	
	
	
		
	jmp task_3					;---

strlen:


	; -- your code here ---
	
	
; --------------------------------------------------------------------------------------------
task_3:
; pouzite rutinu findstr a mozte vyuzit aj rutinu strlen na 
; najdenie vsetkych vyskytov podretazca substr v retazci strAll. 
; 
; pocet vyskytov ulozte do premennej 'nSubstr', jednotlive indexy vyskytov 
; podretazca ulozte do pola 'buffer'.
; 





; --------------------------------------------------------------------------------------------
epilogue:

_epilogue                			; macro -- program exit
