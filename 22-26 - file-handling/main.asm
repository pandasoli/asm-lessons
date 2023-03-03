; vim:ft=nasm

%include 'functions.asm'

section .data
filename db 'readme.txt', 0h
contents db 'Hello, World!', 0h

section .bss
fileContents resb 255

section .text
global _start

_start:
  ; lession 22
  mov ecx, 0777o    ; set all permissions to read, write and execute
  mov ebx, filename
  mov eax, 8        ; invoke SYS_CREAT (kernel opcode 8)
  int 80h

  ; lession 23
  mov edx, 13       ; number of bytes to write
  mov ecx, contents ; move the memory address of our contents string into ecx
  mov ebx, eax      ; move the file descriptor of the file we created into ebx
  mov eax, 4        ; invoke SYS_WRITE (kernel opcode 4)
  int 80h

  ; lession 24
  mov ecx, 0        ; flag for readonly access mode (O_RDONLY)
  mov ebx, filename
  mov eax, 5        ; invoke SYS_OPEN (kernel opcode 5)
  int 80h

  call iprintLF

  ; lession 25
  mov edx, 13           ; number of bytes to read
  mov ecx, fileContents ; move the memory address of our file contents variable into ecx
  mov ebx, eax          ; move the opened file descriptor into ebx
  mov eax, 3            ; invoke SYS_READ (kernel opcode 3)
  int 80h

  mov eax, fileContents
  call sprintLF

  ; lession 26
  mov ebx, ebx ; not needed but used to demonstrate that SYS_CLOSE takes a file descriptor from ebx
  mov eax, 6   ; invoke SYS_CLOSE (kernel opcode 6)
  int 80h

  call quit
