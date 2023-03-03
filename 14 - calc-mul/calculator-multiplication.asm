; vim:ft=nasm

%include 'functions.asm'

section .text
global _start

_start:
  ; The MUL instruction always multiples EAX by whatever value is passed after it.
  ; The answer is left in EAX.

  mov eax, 90  ; move the first number into eax
  mov ebx, 9   ; move the second number into ebx
  mul ebx      ; multiply eax by ebx
  call iprintLF

  call quit
