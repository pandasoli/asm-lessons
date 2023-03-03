; vim:ft=nasm

%include 'functions.asm'

section .data
filename db 'readme.txt', 0h
contents db '-updated-', 0h

section .bss
fileContents resb 255

section .text
global _start

_start:
  mov ecx, 1        ; flag for writeonly access mode (O_WRONLY)
  mov ebx, filename
  mov eax, 5        ; invoke SYS_OPEN (kernel opcode 5)
  int 80h

  mov edx, 2   ; whence argument (SEEK_END)
  mov ecx, 0   ; move the cursor 0 bytes
  mov ebx, eax ; move the opened file descriptor into ebx
  mov eax, 19  ; invoke SYS_LSEEK (kernel opcode 19)
  int 80h

  mov edx, 9        ; number of bytes to write
  mov ecx, contents ; move teh memory address of our contents string into ecx
  mov ebx, ebx      ; move the opened file descriptor into ebx (not requires as ebx already has the FD)
  mov eax, 4        ; invoke SYS_WRITE (kernel opcode 4)
  int 80h

  call quit
