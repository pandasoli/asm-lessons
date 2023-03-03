; vim:ft=nasm

%include 'functions.asm'

section .data
msg1 db 'Hello, brave new world!', 0h         ; remove the linefeed characters
msg2 db 'This is how we recycle in NASM.', 0h ; from both variables

section .text
global _start

_start:
  mov eax, msg1
  call sprintLF ; call the function that prints the linefeed

  mov eax, msg2
  call sprintLF ; again

  call quit ; call our quit function
