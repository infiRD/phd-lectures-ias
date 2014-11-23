; ========================================================== ;
;                                                            ;
; Supporting library for IAS subject labs                    ;
;                                                            ;
; Version: 				v0.2                                 ;
; Date:					2014-11-22                           ;
; Author: 				Martin Zamba (izamba@fit.vutbr.cz)   ;
; Based on code by: 	Filip Orsag (orsag@fit.vutbr.cz)     ;
;                                                            ;
; ========================================================== ; 

bits 32
cpu X64

global _start

; C Run-Time libraray functions - msvcrt.dll:
extern printf
extern ExitProcess

; ========================================================== ; 
;                           Macros                           ;
; ========================================================== ; 

%macro _prologue 0
	_start:

	call WriteNewLine 
%endmacro

%macro _epilogue 0
	xor EAX,EAX
	push dword 0
	call ExitProcess
	ret
%endmacro

%macro _string 2+
	%1: DB %2
	endof.%1: DB 0
	lenof.%1 EQU endof.%1 - %1
	sizeof.%1 EQU endof.%1 - %1
%endmacro

; ========================================================== ; 
;                          Constants                         ;
; ========================================================== ; 

%define EOL 10
%define MAX_UBYTE 0xFF
%define MAX_UWORD 0xFFFF
%define MAX_UDWORD 0xFFFFFFFF
%define MAX_STRING_LENGTH 1024

; ========================================================== ; 
;                          Variables                         ;
; ========================================================== ; 
[section .data use32 class=DATA align=4]

_string msg_EOL, EOL

format_char:		db "%c",0
format_string:		db "%s",0
format_int:			db "%d",0
format_uint:		db "%u",0
format_float:		db "%f",0
msg_Flags:			db 'Flags: |OF|DF|IF|TF|SF|ZF|--|AF|--|PF|--|CF|',EOL,'       | '
msg_FlagValues:		db          'x| x| x| x| x| x| x| x| x| x| x| x|',EOL, 0
ioBuffer:			times MAX_STRING_LENGTH db '!'
					db 0
					
; ========================================================== ; 
;                         Functions                          ;
; ========================================================== ; 

[section .libIAS use32 class=CODE]

;----------------------------------------
; WriteChar
; Will print a characer stored in AL register
;
;----------------------------------------
WriteChar:

	push EAX
	push ECX
	push EDX
	
	movzx ECX,AL
	push ECX
	push format_char
	call printf
	add ESP,8
	
	pop EDX
	pop ECX
	pop EAX

	ret


;----------------------------------------
; WriteNewLine
; Will print EndOfLine ASCII LF = 10
;
;----------------------------------------
WriteNewLine:

	push EAX
	push ECX
	push EDX
	
    push msg_EOL    
    call printf
	add ESP,4

	pop EDX
	pop ECX
	pop EAX
	
	ret

;----------------
; WriteString
; Will print null-terminated string (string followed by 0)
; String address must be stored in ESI register
; 
; Usage:
; mov ESI, strPointer
; call WriteString
;
;----------------------------------------
WriteString:

	push EAX
	push ECX
	push EDX

	push ESI
	push format_string
	call printf
	add ESP,8
	
	pop EDX
	pop ECX
	pop EAX
	
    ret
    
;----------------
; Function WriteBinX (8, 16, 32) {WriteBin8, WriteBin16, WriteBin32}
; will write 8,16,32 bits from EAX register 
;
WriteBin8:
    pushfd
    push ECX
    push EAX

    mov ECX,8
    rcl EAX,24
    jmp WriteBin

WriteBin16:
	pushfd
    push ECX
    push EAX

    mov ECX,16
    rcl EAX,16
    jmp WriteBin

WriteBin32:
	pushfd
    push ECX
    push EAX

    mov ECX,32
	
WriteBin:

    push EBX
    push EDI
	push ESI

    cld
    mov EDI,ioBuffer
    mov EBX,EAX
    xor EDX, EDX
    
WriteBin.next_bit:
    ; convert bit to ASCII '0' or '1':
    rcl EBX,1
    setc AL
    add AL,'0'
    stosb
    ; store space every 4 characters:
    cmp DL, 3
    jnz  WriteBin.jumpOver4
    mov DL, -1
    mov AL, ' '
    stosb
WriteBin.jumpOver4:
    inc DL
    ; store another every 8 characters:
    cmp DH, 7
    jnz  WriteBin.jumpOver8
    mov DH, -1
    mov AL, ' '
    stosb
    stosb
WriteBin.jumpOver8:
    inc DH    

    loop WriteBin.next_bit

	mov [EDI], byte 0

	mov ESI,ioBuffer
	call WriteString

	pop ESI
    pop EDI
    pop EBX
    pop EAX
    pop ECX
    popfd
    ret
    
;----------------
; WriteFlags
; Vypise stav registru priznaku
;
WriteFlags:
    push EAX
    push EBX
    push ECX
	push ESI
	push EDI

    pushfd
    pop EBX
    shl EBX,20

    mov ECX,12
    mov EDI,msg_FlagValues
    
.cycle:
    rcl EBX,1
    setc AL
    add AL,'0'
    mov [EDI],AL
    add EDI,3
    
    loop .cycle

	mov ESI,msg_Flags
	call WriteString

	pop EDI
	pop ESI
    pop ECX
  	pop EBX
  	pop EAX
    ret    
    
;----------------
; Funkce WriteIntX (8,16,32) {WriteInt8,WriteInt16,WriteInt32}
; Vypise 8-, 16-, 32-bitovou celociselnou hodnotu se znamenkem z registru AL, AX, EAX
;
;----------------
; Funkce WriteUIntX (8,16,32) {WriteUInt8,WriteUInt16,WriteUInt32}
; Vypise 8-, 16-, 32-bitovou celociselnou hodnotu bez znamenka z registru AL, AX, EAX
;

WriteInt8:
	push EAX
	movsx EAX,AL
	jmp WriteInt32_noEAX

WriteUInt8:
	push EAX
	movzx EAX,AL
	jmp WriteUInt32_noEAX

WriteInt16:
	push EAX
	movsx EAX,AX
	jmp WriteInt32_noEAX 

WriteUInt16:
	push EAX
	movzx EAX,AX
	jmp WriteUInt32_noEAX

WriteInt32:
	push EAX
WriteInt32_noEAX:
	push ECX
	push EDX

	push EAX
	push dword format_int
	call printf
	add ESP,8

	pop EDX
	pop ECX
	pop EAX
    ret

WriteUInt32:
	push EAX
WriteUInt32_noEAX:
	push ECX
	push EDX

	push EAX
	push dword format_uint
	call printf
	add ESP,8
	
	pop EDX
	pop ECX
	pop EAX
    ret   
    

    
    
    
    