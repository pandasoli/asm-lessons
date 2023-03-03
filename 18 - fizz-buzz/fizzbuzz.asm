; vim:ft=nasm

%include 'functions.asm'

section .data
fizz db 'Fizz', 0h
buzz db 'Buzz', 0h

section .text
global _start

_start:
  mov esi, 0 ; initialise our checkFizz boolean variable
  mov esi, 0 ; initialise our checkBuzz boolean variable
  mov ecx, 0 ; initialise our counter variable

nextNumber:
  inc ecx

.checkFizz:
  mov edx, 0   ; clear to hold our remainder after division

  mov eax, ecx ; move the counter value for division
  mov ebx, 3   ; move our number to divide by into ebx (in this case 3)
  div ebx      ; divide eax by ebx

  mov edi, edx   ; move our remainder into edi (our checkFizz boolean variable)
  cmp edi, 0     ; compare if the remainder is zero (meaning the counter divides by 0)
  jne .checkBuzz ; if the reainder is not equal to zero jump to the `.checkBuzz` label
  
  mov eax, fizz ; else move the address of our fizz string into eax for printing
  call sprint
  ; end then jump to the `.checkBuzz` label

.checkBuzz:
  mov edx, 0

  mov eax, ecx
  mov ebx, 5
  div ebx

  mov esi, edx
  cmp esi, 0
  jne .checkInt

  mov eax, buzz
  call sprint

.checkInt:
  cmp edi, 0   ; edi contains the remainder after the division in checkFizz
  je .continue ; if equal (counter divides by 3) skip printing the integer

  cmp esi, 0   ; esi contains the remainder after the division in checkBuzz
  je .continue ; if equal (counter divides by 5) skip printing the integer

  mov eax, ecx ; else print the counter
  call iprint

.continue:
  mov eax, 0Ah ; move an linefeed into eax
  push eax     ; push the eax onto the stack to preserve it while using it for priting the number
  mov eax, esp ; get the stack pointer (address on the stack of our linefeed)
  call sprint
  pop eax        ; pop the stack so we don't wast resources
  cmp ecx, 100   ; compare if the counter is equal to 100
  jne nextNumber ; if not jump to the start of the loop

  call quit
