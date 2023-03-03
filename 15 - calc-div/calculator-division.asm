; vim:ft=nasm

%include 'functions.asm'

section .data
msg1 db ' remainder ' ; a message to correctly output result

section .text
global _start

_start:
  ; The div instruction always divides eax by the value passed after it.
  ; It will leave the quotient part of the answer in eax and put the remainder part in edx.

  mov eax, 90  ; move the first number into eax
  mov ebx, 9   ; move the second number into ebx
  div ebx      ; divide eax by ebx
  call iprint

  mov eax, msg1 ; move our message into eax for printing
  call sprint

  mov eax, edx  ; move the remainder into eax for printing
  call iprintLF

  call quit
