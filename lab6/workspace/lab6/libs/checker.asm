; ========================================================== ;
;                                                            ;
; Task checker for IAS subject labs                          ;
;                                                            ;
; Version: 	v0.1                                             ;
; Date:		2014-11-23                                       ;
; Author: 	Martin Zamba (izamba@fit.vutbr.cz)               ;
;                                                            ;
; ========================================================== ; 

%ifndef IAS_CHECKER		; to avoid multiple inclusion
%define IAS_CHECKER		;

%include "libs\utils.asm"

; ========================================================== ; 
;                           Macros                           ;
; ========================================================== ; 

%macro _check_EDX 1
	push EDX
	push %1
	call Check
%endmacro

%macro _check_EAX 1
	push EAX
	push %1
	call Check
%endmacro

%macro _exec_strlen_with_stdcall_checksum 1
	push ESP                        ;--- ulozenie hodnot registrov pred  
	push EBP                        ;--- volanim procedury
	push EBX                        ;---
	push ESI                        ;---
	push EDI                        ;---
	push %1                         ;---
    call strlen                     ;---
    pop EDX                         ;---
    sub EDX, EDI                    ;--- ak sa EDI nezmenil, EDX = 0
    add EAX, EDX                    ;---
    pop EDX                         ;---
    sub EDX, ESI                    ;--- ak sa ESI nezmenil, EDX = 0
    add EAX, EDX                    ;---
    pop EDX                         ;---
    sub EDX, EBX                    ;--- ak sa EBX nezmenil, EDX = 0
    add EAX, EDX                    ;---
    pop EDX                         ;---
    sub EDX, EBP                    ;--- ak sa EBP nezmenil, EDX = 0
    add EAX, EDX                    ;---
    pop EDX                         ;---
    sub EDX, ESP                    ;--- ak sa ESP nezmenil, EDX = 0
    add EAX, EDX                    ;---
%endmacro 

%macro _exec_findstr_with_stdcall_checksum 2
	push ESP                        ;--- ulozenie hodnot registrov pred  
	push EBP                        ;--- volanim procedury
	push EBX                        ;---
	push ESI                        ;---
	push EDI                        ;---
	push %2                         ;---
	push %1                         ;---
    call findstr                    ;---
    pop EDX                         ;---
    sub EDX, EDI                    ;--- ak sa EDI nezmenil, EDX = 0
    add EAX, EDX                    ;---
    pop EDX                         ;---
    sub EDX, ESI                    ;--- ak sa ESI nezmenil, EDX = 0
    add EAX, EDX                    ;---
    pop EDX                         ;---
    sub EDX, EBX                    ;--- ak sa EBX nezmenil, EDX = 0
    add EAX, EDX                    ;---
    pop EDX                         ;---
    sub EDX, EBP                    ;--- ak sa EBP nezmenil, EDX = 0
    add EAX, EDX                    ;---
    pop EDX                         ;---
    sub EDX, ESP                    ;--- ak sa ESP nezmenil, EDX = 0
    add EAX, EDX                    ;---
%endmacro 

; ========================================================== ; 
;                          Variables                         ;
; ========================================================== ; 

[section .data] 	

sTask: 				db  "Check",0
sPaddedColon:	 	db  ": ",0
sFailed: 			db  "Result check failed! ",0
sCorrectResultPad:	db	" (correct result) <> ", 0
sPassed: 			db  "Pass",0
sErr_wrongTaskNum: 	db 	"ERROR: Wrong task number (",0

; ========================================================== ; 
;                         Functions                          ;
; ========================================================== ; 

[section .checker] 	

;----------------------------------------
; CheckTask(taskNum, result)
; 
; Will check result from given task against 
; globally visible 'dd results' array. Task 1
; has its result stored in [results+0] etc.
;
;----------------------------------------
Check:
	push EBP          	; stack-frame enter (save EBP)
  	mov  EBP,ESP      	; stack-frame enter (EBP points to the top of the stack)
	
	push EAX
	push EBX
	push EDX
	
	; check taskNum for correctness (1..10)
	mov EAX, [EBP+8]	; param 1 (taskNum)
	cmp EAX, 10
	jg CheckTask.taskNumErr 	; not ok if > 10
	cmp EAX, 0
	jle CheckTask.taskNumErr	; not ok if <= 0
	jmp CheckTask.taskNumOk
CheckTask.taskNumErr:	
	_write sErr_wrongTaskNum
	_iwrite [EBP+8]				; param 1 (taskNum)
	_putchar ')'
	_nl
	jmp CheckTask.return
CheckTask.taskNumOk:

	; display "Task x: ...result..."
	_write sTask
	_putchar ' '
	_iwrite [EBP+8]				; param 1 (taskNum)
	_write sPaddedColon
	
	; check for correct result
	dec al
	mov bl, 4			; multiply taskNum by 4 to get offset, result in AH:AL
	mul bl
	mov EBX, results
	add EBX, EAX		; now we get proper offset in EBX
	
	mov EDX, [EBP+12]	; param 2 (result)
	mov EAX, [EBX]		; correct result from results array
	
	cmp EAX, EDX		; compare results
	je	CheckTask.ok
CheckTask.notOk:
	_write sFailed		; write failed message
	_iwrite EAX			; correct result from results array is still in EAX
	_write sCorrectResultPad
	_iwrite EDX
	jmp CheckTask.common 

CheckTask.ok:
	_write sPassed		; write pass message

CheckTask.common:	
	_nl
	
CheckTask.return:		; restore registers and return
	pop EDX
	pop EBX
	pop EAX

	mov  ESP,EBP      	; stack-frame leave (restore ESP)
	pop  EBP          	; stack-frame leave (restore EBP)
	ret 8      			; remove 2 parameters from the stack
	
	
%endif				; to avoid multiple inclusion