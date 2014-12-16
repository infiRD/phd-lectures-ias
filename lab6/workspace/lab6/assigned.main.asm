; ================================================ 
;
; IAS, lab6
; Fri, 12.12.2014
;
; Author: ---- fill-in using format: xlogin00 ----
;
; ================================================

%include 'libs\utils.asm'
%include 'libs\checker.asm'

[section .data] 	; data segment definition

; <testing_data>
%ifdef TEST
	substr:		db "kujem", 0
	
	str1:		db "podkovicku konikovi", 0
	str2:		db "podkovicku kujem", 0
	str3:		db "kujem podkovicku", 0
	strAll:		db "kujem, kujem podkovicku, konikovi na nozicku. kujem vesele, zo zeleza ocele", 0
	
	results:	dd 5, 19, 16, 16, 0, -1, 11, 0,  3, 53
 
%else
	;          THESE are data valid for normal run
	;           |
	;           v
	substr:		db "ko", 0
	str1:		db "kos kokosov", 0
	str2:		db "asko", 0
	str3:		db "lopata", 0
	strAll:		db "nakosil som plny kos kokosov"
	
	results:	dd 2, 11, 4, 6, 2, 0, 2, -1, 4, 63
%endif
; </testing_data>

[section .bss] 	; bss (uninitialised data) segment definition
	buffer:     resb    64
	nSubstr:    resb    1

[section .text use32 class=CODE] 	; basis segment definition

_prologue                			; macro -- program initialisation

; --------------------------------------------------------------------------------------------
; Zadanie:
; - tento subor s nazvom 'assigned.main.asm' ulozte ako 'main.asm'
; - rieste ulohy 1..3 v zdrojovom kode nizsie
; - (!) needitujte a neodstranujte riadky s komentarom ;--- na konci
; - v odovzdanej verzii programu nevypisujte nic na konzolu
; - vystup programu po spusteni run, alebo test musi byt pre plny bodovy zisk takyto:
;     
;     Check 1: Pass
;     Check 2: Pass
;     Check 3: Pass
;     Check 4: Pass
;     Check 5: Pass
;     Check 6: Pass
;     Check 7: Pass
;     Check 8: Pass
;     Check 9: Pass
;     Check 10: Pass
;    
; - <testing_data> neupravujte ! 
;   Ak testing_data upravite, tak v odovzdanej verzii musia byt testing data totozne 
;   s tymto zadanim. Pre ohodnotenie/kontrolu zadania bude pouzita utajena, tretia sada dat.
; - kod doplnujte za znacky '; -- your code here ---', pripadne tieto znacky mozte odstranit
; --------------------------------------------------------------------------------------------



; --------------------------------------------------------------------------------------------

task_1:
; vytvorte proceduru strlen() na najdenie dlzky retazca (napr. str).
; Procedura strlen nech ma semantiku (zapisana ako v C):   
; 
; int32_t strlen( char* str )
;
; int32_t    je 32 bitovy znamienkovy datovy typ
; char*      je pointer na char (32bitova adresa retazca v pamati)
; 
; return value je dlzka retazca 
;
; ! pre predavanie parametrov pouzite konvenciu stdcall 
;
; Priklad 1:
;	str = "ma"
;	navratova hodnota (EAX) = 2 	
;
; Priklad 2:
;	str = "" (prazdny retazec)
;	navratova hodnota (EAX) = 0  
;
; (1 bod)
    
    jmp t1_check                    ;--- preskocenie implementacie strlen
                                    ;--- za bezneho behu programu
     
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;
; Zaciatok implementacie procedury            ;
; int32_t strlen(char* str)                   ;
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;
strlen:                             ;---
; - zaciatok prologu procedury      ;---      

	; -- your code here ---




; - koniec prologu procedury        ;---  
; - zaciatok tela procedury         ;---     

	; -- your code here ---




; - koniec tela procedury           ;---     
; - zaciatok epilogu procedury	    ;---

	; -- your code here ---
	
	
	
    ret
    
; - koniec epilogu procedury        ;---
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;
; Koniec implementacie strlen                 ;
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;

t1_check:                           ;---
; kontrola, ci strlen splna konvenciu stdcall
; - predanie parametra cez zasobnik
; - vysledok v EAX
; - zachovanie registrov ESP, EBP, EBX, ESI, EDI 
    _exec_strlen_with_stdcall_checksum substr  ;---
	_check_EAX 1                               ;---
    
; zavolajte strlen pre retazec str1

	; -- your code here ---
				
				
				
	_check_EAX 2                    ;---

; zavolajte strlen pre retazec str1

	; -- your code here ---



	_check_EAX 3                    ;---
	
; zavolajte strlen pre retazec str1

	; -- your code here ---



	_check_EAX 4                    ;---

	
; --------------------------------------------------------------------------------------------	

task_2:                             ;---
; vytvorte proceduru findstr() na najdenie podretazca (napr. substr) v retazci (napr. str).
; Procedura findstr nech ma semantiku (zapisana ako v C):   
; 
; int32_t findstr( char* str, char* substr )
;
; int32_t    je 32 bitovy znamienkovy datovy typ
; char*      je pointer na char (32bitova adresa retazca v pamati)
; 
; return value je index prveho vyskytu podretazca v retazci, pripadne -1 ak sa podretazec
; v retazci nenachadza
;
; ! pre predavanie parametrov pouzite konvenciu stdcall 
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
; (1 bod)
    
    jmp t2_check                    ;--- preskocenie implementacie findstr
                                    ;--- za bezneho behu programu
     
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;
; Zaciatok implementacie procedury            ;
; int32_t findstr( char* str, char* substr )  ;
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;
findstr:                            ;---
; - zaciatok prologu procedury      ;---      

	; -- your code here ---




; - koniec prologu procedury        ;---  
; - zaciatok tela procedury         ;---     

	; -- your code here ---




; - koniec tela procedury           ;---     
; - zaciatok epilogu procedury	    ;---

	; -- your code here ---



    ret    
    
; - koniec epilogu procedury        ;---
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;
; Koniec implementacie findstr                ;
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;

t2_check:						    ;---
; kontrola, ci findstr splna konvenciu stdcall
; - predanie parametrov cez zasobnik
; - vysledok v EAX
; - zachovanie registrov ESP, EBP, EBX, ESI, EDI 
    _exec_findstr_with_stdcall_checksum strAll, substr  ;---
	_check_EAX 5                                       ;---

; zavolajte proceduru findstr pre podretazec substr a retazec str1
; navratova hodnota je podla stdcall v registri EAX 
	
	; -- your code here ---
	
	
	
	
    _check_EAX 6                    ;---
    
; zavolajte subrutinu findstr pre podretazec substr a retazec str2
	
	; -- your code here ---
	
	
	
	
    _check_EAX 7                    ;---
	
; zavolajte subrutinu findstr pre podretazec substr a retazec str3
	
	; -- your code here ---
	
	
	
	
    _check_EAX 8                    ;---	
    jmp task_3                      ;---

; --------------------------------------------------------------------------------------------	

task_3:
; pouzite procedury strlen a findstr na vytvorenie algoritmu pre
; najdenie vsetkych vyskytov podretazca v retazci 
; 
; pocet vyskytov ulozte do premennej 'nSubstr', jednotlive indexy vyskytov 
; podretazca ulozte do pola 'buffer'.
; 
; ! pozor: pole 'buffer' a premenna 'nSubstr' su velkosti jeden bajt
;
; (1 bod)
;

	; -- your code here ---




	
t3_check:                           ;---
    movzx EDX, byte [nSubstr]       ;---
    _check_EDX 9                    ;---
    movzx ECX, byte [nSubstr]       ;---
    cmp ECX, 0                      ;---
    je t3_checkEndLoop              ;---
    xor EDX, EDX                    ;--- 
t3_sumUp:                           ;---
    movzx EAX, byte [buffer + ECX - 1]  ;--- 
    add EDX, EAX                    ;---
    loop t3_sumUp                   ;---
t3_checkEndLoop:                    ;---
    _check_EDX 10                   ;---
	
; --------------------------------------------------------------------------------------------
epilogue:

_epilogue                			; macro -- program exit


