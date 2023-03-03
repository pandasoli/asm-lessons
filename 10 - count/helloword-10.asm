; vim:ft=nasm

%include 'functions.asm'

section .text
global _start

_start:
  mov ecx, 0 ; ecx is initialised to zero

nextNumber:
  inc ecx ; increment ecx

  mov eax, ecx ; move the address of our integer into eax
  add eax, 48  ; add 48 to our number to convert from integer to ASCII for printing
  push eax     ; push eax to the stack

  mov eax, esp ; get the address of the character on the stack to print it
  call sprintLF

  pop eax        ; clean up the stack so we don't have unneeded bytes taking up space
  cmp ecx, 10    ; have we reached 10 yet? compare our counter with decimal 10
  jne nextNumber ; jump if not equal and keep counting

  call quit
