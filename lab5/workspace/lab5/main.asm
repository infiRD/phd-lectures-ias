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

; Testing data
%ifdef TEST
	substr:		db "kujem", 0
	
	str1:		db "podkovicku konikovi", 0
	str2:		db "podkovicku kujem", 0
	str3:		db "kujem podkovicku", 0
	strAll:		db "kujem, kujem podkovicku, konikovi na nozicku. kujem vesele, zo zeleza ocele", 0
	
	results:	dd -1, 11, 0, 19, 16, 16, 3, 53
 
%else
	;          THESE are data valid for normal run
	;           |
	;           v
	substr:		db "ko", 0
	str1:		db "kos kokosov", 0
	str2:		db "asko", 0
	str3:		db "lopata", 0
	strAll:		db "nakosil som plny kos kokosov"
	
	results:	dd 0, 2, -1, 11, 4, 6, 4, 63

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

task_1:                         ;---
; Create a subroutine 'findstr' which will find a substring (substr) in a 
; string (str). You can use whatever registers you find appropriate. 
; I reccomend however, to utilise registers ESI and EDI to pass offsets
; to string and substring. Subroutine should return -1 if there was no match 
; whatsoever
;
; Example 1:
;	substr = "ma"
;	str = "mama ma emu"
;	ret.value = 0 	
;
; Example 2:
;	substr = "ma"
;	str = "emu ma"
;	ret.value = 4 	
; 
; Example 3:
;	substr = "ma"
;	str = "emu"
;	ret.value = -1 	
;
; (2 points)

t1_check:						;---
; call the findstr subroutine for sunbstring 'substr' and string str1
; return value store into EDX register 
	
	 ; -- your code here ---
	 
	mov ESI, str1				; ESI is source string, EDI is string we are matching  
	mov EDI, substr
	call findstr 
	
	_check 1                    ;---

; call the findstr subroutine for sunbstring 'substr' and string str2
; return value store into EDX register 
	
	 ; -- your code here ---
	mov ESI, str2			; ESI is source string, EDI is string we are matching  
	mov EDI, substr
	call findstr 

	_check 2                    ;---
	
; call the findstr subroutine for sunbstring 'substr' and string str3
; return value store into EDX register 
	
	 ; -- your code here ---
	mov ESI, str3			; ESI is source string, EDI is string we are matching  
	mov EDI, substr
	call findstr 

	_check 3                    ;---	
 	jmp task_2                  ;---

findstr:                        ;---
	; -- your code here ---
	push EAX
	push EBX
	push ECX

	xor EBX, EBX
	xor ECX, ECX
	xor EDX, EDX
	xor EAX, EAX

findstr_loop:
	mov AL, [ESI + EBX]         ; string
	mov DL, [EDI + ECX]         ; substring	

	cmp DL, 0
	jne notAtTheEndOfSubstrYet
								; we are at the end of the substring - we have a match then !
	mov EDX, EBX				; EBX - actual offset inside the string 
	sub EDX, ECX				; ECX - lenght of the substring (we've just hit substring's end)
	jmp findstr_end
notAtTheEndOfSubstrYet:
	cmp AL, 0
	jne notAtTheEndOfStrYet
								; we are at the end of the big string - we haven't found the match
	mov EDX, -1					; code for 'not found'								
	jmp findstr_end
notAtTheEndOfStrYet:
	cmp AL, DL					
	jne notEq
								; we have a match on character level, move on to next chars
	inc EBX
	inc ECX
	jmp findstr_loop
notEq:							; characters are not equal, rewind substring and try to match again	
	cmp ECX, 0
	je substrAlreadyRewound 
	xor ECX, ECX
	jmp findstr_loop
substrAlreadyRewound:			; if the substring is already rewound, increment string index	
	inc  EBX
	jmp findstr_loop
	
findstr_end:
	pop ECX
	pop EBX
	pop EAX

	ret
; --------------------------------------------------------------------------------------------
_epilogue                			; macro -- program exi


task_2:
; create routine strlne, which will compute length of given string
; Strings are normally terminated according to C convencion by zero byte
; It does not matter how you will pass the parameters to and from 
; the routine   
;
; (0.5 bodu)

t2_check:
; call the strlen routine for string str1
; return value stor into EDX register

	; -- your code here ---
	mov ESI, str1			  
	call strlen 
 	
	_check 4                    ;---
	
; call the strlen routine for string str2
; return value stor into EDX register

	; -- your code here ---
 	mov ESI, str2			  
	call strlen 
 	
	_check 5                    ;---
	
; call the strlen routine for string str3
; return value stor into EDX register

	; -- your code here ---
	mov ESI, str3			  
	call strlen 
 	
	_check 6                    ;---
	
	jmp task_3                  ;---

strlen:
	; -- your code here ---
	xor EDX, EDX                ; count the lenght of the matching string
cntSrcLen:
	inc EDX 
	cmp byte [ESI + EDX], 0
	jne cntSrcLen
	ret
	
; --------------------------------------------------------------------------------------------	

task_3:
; utilise the findstr routine and optionaly also strlen routine 
; to find all occurences of given substring in a given string - strAll.
;
; number of occurences store into 'nSubstr' variable, occurence offsets
; store into uninitialised aray of bytes 'buffer'
; 
; ! note, that array 'buffer' and variable 'nSubstr' are of byte granularity
;
; (0.5 point)
;
	; -- your code here ---
	mov ESI, substr			
	call strlen
	mov EBX, EDX			; call strlen and store substring's lenght
	
	mov byte [nSubstr], 0
	
	mov ESI, strAll			; ESI is the source string, EDI is the string we are matching  
	mov EDI, substr
	xor ECX, ECX			; used as counter
find_more:	
	call findstr
	cmp EDX, -1
	je t3_end
	add ESI, EDX			; we should start looking again at index where substring
	add ESI, EBX			; have been found + substring's lenght (is in EAX)
	
	mov EAX, ESI
	sub EAX, strAll
	sub EAX, EBX
	
	;_iwriteln EAX			; print out what we have found
	mov [buffer + ECX], AL
	inc ECX					; increment the counter
	jmp find_more

t3_end:
	movzx EAX, byte [nSubstr]
	mov [nSubstr], CL
	;_iwriteln ECX			; print out the number of occurences
	
t3_check:                               ;---
	movzx EDX, byte [nSubstr]           ;---
	_check 7                            ;---
	movzx ECX, byte [nSubstr]           ;---
	cmp ECX, 0                          ;---
	je t3_checkEndLoop                  ;---
	xor EDX, EDX                        ;--- 
t3_sumUp:                               ;---
	movzx EAX, byte [buffer + ECX - 1]  ;--- 
	add EDX, EAX                        ;---
	loop t3_sumUp                       ;---
t3_checkEndLoop:                        ;---
	_check 8                            ;---
	
; --------------------------------------------------------------------------------------------
epilogue:

_epilogue                			; macro -- program exit