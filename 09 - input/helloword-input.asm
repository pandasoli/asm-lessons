; vim:ft=nasm

%include 'functions.asm'

section .data
msg1 db 'Please enter your name: ', 0h ; message asking user for input
msg2 db 'Hello, ', 0h                  ; message to use after user has entered their name

section .bss
sinput resb 255 ; reserve a 255 byte space memory for the user input string

section .text
global _start

_start:
  mov eax, msg1
  call sprint

  mov edx, 255    ; number of bytes to read
  mov ecx, sinput ; reserved space to store our input (known as a buffer)
  mov ebx, 0      ; read from STDIN file
  mov eax, 3      ; invoke SYS_READ (kernel opcode 3)
  int 80h

  mov eax, msg2
  call sprint

  mov eax, sinput
  call sprint

  call quit
