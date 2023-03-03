; vim:ft=nasm

section .data
msg db 'Hello, World!', 0Ah

section .text
global _start

_start:
  mov edx, 14
  mov ecx, msg
  mov ebx, 1
  mov eax, 4
  int 80h

  mov ebx, 0 ; return 0 status (no errors)
  mov eax, 1 ; invoke SYS_EXIT
  int 80h
