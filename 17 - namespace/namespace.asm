; vim:ft=nasm

%include 'functions.asm'

section .data
msg1 db 'Jumping to finished label.', 0h
msg2 db 'Inside subroutine number: ', 0h
msg3 db 'Inside subroutine "finished".', 0h

section .text
global _start

_start:

subroutineOne:
  mov eax, msg1
  call sprintLF
  jmp .finished ; jump to the local label under the subroutineOne scope

.finished:
  mov eax, msg2
  call sprint
  mov eax, 1    ; move the value one into eax (for subroutine number one)
  call iprintLF


subroutineTwo:
  mov eax, msg1
  call sprintLF
  jmp .finished

.finished:
  mov eax, msg2
  call sprint
  mov eax, 2    ; move the value two into eax (for subroutine number two)
  call iprintLF

  mov eax, msg1
  call sprintLF
  jmp finished

finished:
  mov eax, msg3
  call sprintLF
  call quit
