; ================================================ 
;
; IAS, cvicenie 2 
; Pi, 24.10.2014, 8:00-10:00
;
; Autor: ---- doplnte v tvare xlogin00 ----
;
; ================================================

; --------------------------------------------------------------------------------------------
; Zadanie:
; - body 1..4 v zdrojovom kode nizsie
; 5) Kontrolujte pretecenie vsade kde je to ucelne (bonus 0.5 bodu)
; --------------------------------------------------------------------------------------------
 
%include 'ias_lib.asm'  ; podporna mini kniznica
 
[segment .data use32]   ; definicia zaciatku datoveho segmentu

; Postupnost
dSequence db 3, 2, 15

[segment .code use32]   ; definicia zaciatku kodoveho segmentu

prologue                ; makro -- inicializacia programu

uloha_1:
; 1) Prezrite si ulozenie postupnosti v datovom segmente (0.5 bodu)
;     - Napoveda: ulozte si bazovu adresu do registra a obsah pamate od tejto 
;       adresy si zobrazte pomocou monitoru pamate v HEX rezime
;    (0.5 bodu) 

; -- vas kod --  

;---------------------------------------------------------------------------------
  
uloha_2:
; 2) Pouzitim instrukcie AND zistite, ci je prve cislo neparne/liche (1,3,5 ... ). 
;    Ak je neparne tak do registru EDX ulozte hodnotu 1, inak 2
;    - Napoveda: budete potrebovat instrukcie skokov
;    (1 bod)

; -- vas kod --
   
;---------------------------------------------------------------------------------   

uloha_3:
; 3) Spocitajte sumu postupnosti a pomocou instrukcie bitovej rotacie vydelte sumu 
;    dvomi a vysledok ulozte do registra EDX
;    (0.5 bodu)

; -- vas kod --
   
;---------------------------------------------------------------------------------   

uloha_4:
; 3) Vypocitajte objem kvadru, kde cisla postupnosti udavaju dlzku hran
;    a vysledok ulozte do registra EDX
;    (0.5 bodu)

; -- vas kod --
   
;---------------------------------------------------------------------------------  


epilogue                ; makro -- ukoncenie programu


        
        
        
        