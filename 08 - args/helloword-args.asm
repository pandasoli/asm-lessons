; vim:ft=nasm

%include 'functions.asm'

section .text
global _start

_start:
  pop ecx ; first value of the stack is the number of args

nextArg:
  cmp ecx, 0h   ; check to see if we have anu args left
  jz noMoreArgs ; if zero flag is set jump to `noMoreArgs` label

  pop eax       ; pop the next arg off the stack and put it in eax
  call sprintLF ; call our print with linefeed function

  dec ecx       ; decrease ecx (number of args left) by 1
  jmp nextArg

noMoreArgs:
  call quit
