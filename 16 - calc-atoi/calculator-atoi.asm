; vim:ft=nasm

%include 'functions.asm'

section .text
global _start

_start:
  pop ecx    ; first value on the stack is the number of args
  pop edx    ; second value on the stack is the program name (discarted when we initialise edx)
  sub ecx, 1 ; decrement ecx by 1 (number of agrs without the program name)
  mov edx, 0 ; initialise our data register to store additions

nextArg:
  cmp ecx, 0h   ; check to see if we have any args left
  jz noMoreArgs ; if zero flag is set jump to the `noMoreArgs` label

  pop eax      ; pop the next arg off the stack
  call atoi    ; convert the arg to integer
  add edx, eax ; and add it to the result

  dec ecx ; decrease ecx (number or args left) by 1
  jmp nextArg

noMoreArgs:
  mov eax, edx  ; move our data result into eax for printing
  call iprintLF

  call quit
