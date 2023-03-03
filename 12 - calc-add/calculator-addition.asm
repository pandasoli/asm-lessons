; vim:ft=nasm

%include 'functions.asm'

section .text
global _start

_start:
  mov eax, 90  ; move the first number into eax
  mov ebx, 9   ; move the second number into ebx
  add eax, ebx ; add ebx to eax
  call iprintLF

  call quit
