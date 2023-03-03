; vim:ft=nasm

section .data
msg db 'My name is Panda and I probably do not like you!', 0Ah

section .text
global _start

_start:
  mov ebx, msg ; move `msg` address to ebx
  mov eax, ebx ; move the address in ebx to eax

nextchar:
  cmp byte [eax], 0 ; compare the byte pointed to by eax at this address against zero (zero is an end of string delimiter)
  jz finished       ; jump (if the zero flagged has been set) to finished
  inc eax           ; increment the address in eax by one byte
  jmp nextchar      ; jump to the start of the `nexchar` label

finished:
  sub eax, ebx ; subtract the address in ebx from the address in eax
               ; remember both registers started pointing to the same address
               ; but eax has been incremented one byte for each character in `msg`
               ; when you subtract one memory address from another of the same type
               ; the result is a number of segments between them - in this case the number of bytes

  mov edx, eax
  mov ecx, msg
  mov ebx, 1
  mov eax, 4
  int 80h

  mov ebx, 0
  mov eax, 1
  int 80h
