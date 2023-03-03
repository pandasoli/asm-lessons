; vim:ft=nasm

section .data
msg db 'Hwllo, brave new world!', 0Ah

section .text
global _start

_start:
  mov eax, msg
  call strlen  ; call `strlen` to calculate the length of `msg`

  mov edx, eax
  mov ecx, msg
  mov ebx, 1
  mov eax, 4
  int 80h

  mov ebx, 0
  mov eax, 1
  int 80h

strlen:        ; our function declaration
  push ebx     ; push the value of ebx onto the stack to preserve it while we use ebx in this function
  mov ebx, eax ; move the address in eax into ebx

nextchar:
  cmp byte [eax], 0
  jz finished
  inc eax
  jmp nextchar

finished:
  sub eax, ebx
  pop ebx ; pop the value on the stack back into ebx
  ret     ; return to where the function was called
