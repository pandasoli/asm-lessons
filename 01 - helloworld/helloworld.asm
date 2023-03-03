; vim:ft=nasm

section .data
msg db 'Hello, World!', 0Ah ; assign `msg` with a message plus a line feed char

section .text
global _start

_start:
  mov edx, 14  ; number of bytes to write
  mov ecx, msg ; move memory address to ecx
  mov ebx, 1   ; output to STDOUT
  mov eax, 4   ; invoke SYS_WRITE
  int 80h      ; "Do it!"
