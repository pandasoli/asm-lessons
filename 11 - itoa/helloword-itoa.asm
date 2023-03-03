; vim:ft=nasm

%include 'functions.asm'

section .text
global _start

_start:
  mov ecx, 0

nextNumber:
  inc ecx

  mov eax, ecx
  call iprintLF

  cmp ecx, 10
  jne nextNumber ; now calling the integer printing function (itoa)

  call quit
