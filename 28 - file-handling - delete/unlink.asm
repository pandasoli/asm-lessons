; vim:ft=nasm

%include 'functions.asm'

section .data
filename db 'readme.txt', 0h

section .text
global _start

_start:
  mov ebx, filename
  mov eax, 10       ; invoke SYS_UNLINK (kernel opcode 10)
  int 80h

  call quit
