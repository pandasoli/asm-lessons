; vim:ft=nasm

%include 'functions.asm'

section .data
msg1 db 'Hello, brave new world!', 0Ah
msg2 db 'This is how we recycle in NASM.', 0Ah

section .text
global _start

_start:
  mov eax, msg1 ; move the address of `msg1` into eax
  call sprint   ; call the string printing function

  mov eax, msg2 ; move the address of `msg2` into eax
  call sprint   ; call the string printing function

  call quit ; call our quit function
