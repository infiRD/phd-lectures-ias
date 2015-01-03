; ================================================ 
;
; IAS, lab7
; Fri, 19.12.2014
;
; Author: ---- fill-in using format: xlogin00 ----
;
; ================================================

%include 'libs\utils.asm'
%include 'libs\checker.asm'

[section .data] 	; data segment definition

; <testing_data>
%ifdef TEST
    d:          dq 1.0                  ; 64-bit double floating point number
	x:          dw 0, 10, 20, 30, 40, 50, 60, 70, 80, 90   ; uhol v stupnoch (!!)
	n:          dw 10

    results:    dd 1057360530, 1086775679

%else
	;          THESE are data valid for normal run
	;           |
	;           v
	d:          dq 4.567891011          ; 64-bit double floating point number
	x:          dw -30, -25, 25, 30          ; uhol v stupnoch (!!)
	n:          dw 4

	results:    dd 1111989997, 0

%endif
; </testing_data>

const_2:	dw 2
const_3:	dw 3
const_4:	dw 4
const_180:	dw 180

[section .bss] 	; bss (uninitialised data) segment definition
    tmp_dword   resd    1

[section .text use32 class=CODE] 	; basis segment definition

_prologue                			; macro -- program initialisation

; --------------------------------------------------------------------------------------------
; Zadanie:
; - tento subor s nazvom 'assigned.main.asm' ulozte ako 'main.asm'
; - rieste ulohy 1..3 v zdrojovom kode nizsie
; - pre ulahcenie ladenia pouzivajte makra:
;     _fwrite FPU_REG - vypise obsah fpu registra FPU_REG 
;     _fwriteln FPU_REG - rovnako ako _fwrite + znak NewLine
;     _fpu_regs - vypise obsah vsetkych registrov FPU
; - (!) needitujte a neodstranujte riadky s komentarom ;--- na konci
; - v odovzdanej verzii programu nevypisujte nic na konzolu
; - vystup programu po spusteni run a test musi byt pre plny bodovy zisk takyto:
;     
;     Check 1: Pass
;     Check 2: Pass
;    
; - <testing_data> neupravujte ! 
;   Ak testing_data upravite, tak v odovzdanej verzii musia byt testing data totozne 
;   s tymto zadanim. Pre ohodnotenie/kontrolu zadania bude pouzita utajena, tretia sada dat.
; - kod doplnujte za znacky '; -- your code here ---', pripadne tieto znacky mozte odstranit
;
;
; Tipy:
; - vrchol zasobbnika FPU je pristupny skrz register ST0
; - uzitocne makra z utils.asm:
;     _fwrite ST0 - vypise obsah ST0 
;     _fwriteln ST0 - vypise obsah ST0 + new line
;     _fpu_regs - vypise obsah FPU registrov ST0-ST7
; - uzitocne instrukcie: 
;    fldz - ulozi do ST0 konstantu 0
;    fldpi - na vrchol zasobnika FPU vlozi konstantu pi = 3.141592.. 
;    fild word [addr] - na vrhol zasobnika FPU ulozi double float hodnotu 
;                          odpovedajucu 16-bit dlhej celociselnej hodnote 
;                          ulozenej na adrese 'addr'
;    fdivp - delenie v plavajucej desatinnej ciarke: ST1 <- ST1 / ST0, po 
;            vykonani delenia sa vykona operacia POP na zasobniku FPU
;    fmul ST0, ST1 - nasobenie v plavajucej desatinnej ciarke: ST0 <- ST0 * ST1
;    fmulp ST0, ST1 - to iste ako fmul ST0, ST1 + operacia POP na zasobniku FPU
;    fsin - do registra ST0 ulozi hodnotu sin(ST0)
;    fadd ST2, ST0 - spocita ST2 + ST0 a ulozi vysledok do ST2   
;    fxch ST1, ST0 - vymeni obsah ST0 a ST1
;    fst dword [addr] - ulozi 64-bit floating-point cislo z registra ST0 
;                       ako 32-bit floating-point cislo na adresu 'addr'
; 
; --------------------------------------------------------------------------------------------

task_1:                             ;---
; Vypocitajte objem pologule (V) s priemerom (d) a ulozte vysledok ako 32b float
; do registra EDX. 
; 
; objem:     V  = (4/3) * pi * r^3     
; polomer:   r  = d / 2    
;
; (1.5 bodu)
;
    finit						;---
  
  
  
  
    ; -- your code here ---
	
	
	
	
	
task_1_check:
    ; kontrola prebieha porovnanim obsahu 32bit registra EDX s 32bit hodnotou bit-by-bit.
    ; Musite ulozit do registra EDX spravne vypocitane cislo v 32bit 
    ; floating-point formate:
	;
	;    fst dword [tmp_dword]
    ;    mov EDX, [tmp_dword]        
    ;
    ; 
    ; v RUN mode ma byt vysledna hodnota V = 49.905201 (vypisane pomocou _fwriteln ST0),
    ; ktora sa po konverzii na 32bit float rovna hodnote 1111989997 (ako 32bit integer)
    ;
	; v TEST mode V = 0.523599 (ako 32bit float) = 1057360530 (ako 32bit integer)
	;
	
	_check_EDX 1
    
; --------------------------------------------------------------------------------------------

task_2:                             ;---
; Spocitajte sumu:
;
;          n
;         ---
;         \    
;    s =  /    sin(x[i])
;         ---
;        i = 0
;
; a vysledok zapiste do registra EDX. Konstantne pole x a konstanta n 
; su definovane v datovom segmente (.data)
;
; !! Pamatajte na to, ze pole x[] je 16bit pole uhlov v stupnoch. Instrukcia fsin 
;    ocakava uhol v radianoch. Pre konverziu do radianov pouzite:
;
;    x_radians = x_degrees * pi / 180

; (1.5 bodu)
;
    finit						;---
    
	
	
	
    ; -- your code here ---
	
	
	

task_2_check:
    ; kontrola prebieha porovnanim suroveho obsahu 32bit registra
    ; Musite ulozit do registra EDX spravne vypocitane cislo v 32bit 
    ; floating-point formate
    ;
    ;    fst dword [tmp_dword]
    ;    mov EDX, [tmp_dword]   
    ;
    ; 
    ; v RUN mode ma vyjst hodnota SUM = 0.000000 (vypisane pomocou _fwriteln ST0),
    ; ktora sa po konverzii na 32bit float rovna hodnote 0 (ako 32bit integer)
    ;
    ; v TEST mode SUM = 6.215026 (ako 32bit float) = 1086775679 (ako 32bit integer)
    ;
    
    _check_EDX 2

; --------------------------------------------------------------------------------------------

epilogue:

_epilogue                			; macro -- program exit
