; ========================================================== ;
;                                                            ;
; Utilities for IAS subject labs                             ;
;                                                            ;
; Version: 	v0.3                                             ;
; Date:		2015-01-01                                       ;
; Author: 	Martin Zamba (izamba@fit.vutbr.cz)               ;
;                                                            ;
; ========================================================== ; 

%ifndef IAS_UTILS	; to avoid multiple inclusion
%define IAS_UTILS	;

; ========================================================== ; 
;                           Macros                           ;
; ========================================================== ; 

; macro for printing new line character(s)
%macro _nl 0
	call WriteNewLine
%endmacro

; macro will print one character
%macro _putchar 1
	push EAX
	mov AL, %1
	call WriteChar
	pop EAX
%endmacro

; macro will print string starting at parameter
%macro _write 1
	push ESI
	mov ESI, %1
	call WriteString
	pop ESI
%endmacro

; macro will print string starting at parameter + new line
%macro _writeln 1
	_write %1
	_nl
%endmacro

; macro will print 32bit integer at parameter
%macro _iwrite 1
	push EAX
	mov EAX, %1
	call WriteInt32
	pop EAX
%endmacro

; macro will print 32bit integer at parameter + new line
%macro _iwriteln 1
	_iwrite %1
	call WriteNewLine
%endmacro

; macro will convert 64bit floating point number in specified 
; register to 32bit format and print it
%macro _fwrite 1
	push EAX
	fxch %1                     ; swap given register into ST0
	fst dword [fwriteln_buf]      ; convert it to 32bit float and store into buffer
	fxch %1						; swap given register content back from ST0
	mov EAX, [fwriteln_buf]
	call WriteFloat
	pop EAX
%endmacro

; macro will convert 64bit floating point number in specified 
; register to 32bit format and print it with new line character at end 
%macro _fwriteln 1
	_fwrite %1
	call WriteNewLine
%endmacro

; macro will print out the content of FPU registers
%macro _fpu_regs 0
	_writeln fpu_str_caption
	_write fpu_str_ST0
	_fwriteln ST0
	_write fpu_str_ST1
	_fwriteln ST1
	_write fpu_str_ST2
	_fwriteln ST2
	_write fpu_str_ST3
	_fwriteln ST3
	_write fpu_str_ST4
	_fwriteln ST4
	_write fpu_str_ST5
	_fwriteln ST5
	_write fpu_str_ST6
	_fwriteln ST6
	_write fpu_str_ST7
	_fwriteln ST7
%endmacro


; ========================================================== ; 
;                          Variables                         ;
; ========================================================== ; 
[section .bss] 	; bss (uninitialised data) segment definition
	fwriteln_buf:            resd    1

; ========================================================== ; 
;                          Variables                         ;
; ========================================================== ; 
[section .data use32 class=DATA] 	
	fpu_str_caption: db 'FPU register content:', 0
	fpu_str_ST0:	db ' ST0: ', 0
	fpu_str_ST1:	db ' ST1: ', 0
	fpu_str_ST2:	db ' ST2: ', 0
	fpu_str_ST3:	db ' ST3: ', 0
	fpu_str_ST4:	db ' ST4: ', 0
	fpu_str_ST5:	db ' ST5: ', 0
	fpu_str_ST6:	db ' ST6: ', 0
	fpu_str_ST7:	db ' ST7: ', 0
	

; ========================================================== ; 
;                         Functions                          ;
; ========================================================== ; 

[section .checker use32 class=CODE] 	

%endif				; to avoid multiple inclusion
	
	
	
	
	
	