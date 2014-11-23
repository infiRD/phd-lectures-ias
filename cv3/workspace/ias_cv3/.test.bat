@echo off

set fn=%1
echo Procesing file: %fn%.asm

if not exist %fn%.o goto j1
del %fn%.o

:j1
if not exist %fn%.exe goto j2
del %fn%.exe

:j2
if not exist %fn%.asm goto input_err

if not exist tools\nasm.exe goto no_compiler

echo Compilation of "%fn%.asm" using NASM
tools\nasm -fobj -p libs/libIAS_alink.asm -d TEST %fn%.asm

if not exist %fn%.obj goto compile_err
rename %fn%.obj %fn%.o

if not exist tools\alink.exe goto no_linker

echo Linking using ALINK:
tools\alink -oPE -subsys console %fn%.o

if not exist %fn%.exe goto link_err

echo -------------------------------------------------------------
echo Run of %fn%.exe:
echo -------------------------------------------------------------
%fn%.exe
echo -------------------------------------------------------------
goto exit

:input_err
	echo File %fn%.asm doesn't exist.
	goto exit
:no_compiler
	echo Can't find NASM.EXE.
	goto exit
:no_linker
	echo Can't find ALINK.EXE.
	goto exit
:compile_err
	echo Compilation error while running NASM.EXE.
	goto exit
:link_err
	echo Linking error while running ALINK.EXE.
:exit
    