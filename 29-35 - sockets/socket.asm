; vim:ft=nasm

%include 'functions.asm'

section .data
response db 'HTTP/1.1 200 OK', 0Dh, 0Ah, 'Content-Type: text/html', 0Dh, 0Ah, 'Content-Length: 15', 0Dh, 0Ah, 0Dh, 0Ah, 'Hello, World!', 0Dh, 0Ah, 0h

section .bss
buffer resb 255 ; variable to store request headers

section .text
global _start

; lession 29
_start:
  ; initialise registers with 0
  xor eax, eax
  xor ebx, ebx
  xor edi, edi
  xor esi, esi

_socket:
  push byte 6 ; push 6 onto the stack (IPPROTO_TCP)
  push byte 1 ; push 1 onto the stack (SOCK_STREAM)
  push byte 2 ; push 2 onto the stack (PF_INET)

  mov ecx, esp ; move address of args into ecx
  mov ebx, 1   ; invoke subroutine SOCKET (1)
  mov eax, 102 ; invoke SYS_SOCKETCALL (kernel opcode 102)
  int 80h

  call iprintLF ; print eax that has the file descriptor, or -1 on error

; lession 30
_bind:
  mov edi, eax ; move the file descriptor into edi

  push dword 0x00000000 ; push 0 dec onto stack IP ADDRESS (0.0.0.0)
  push word 0x2923      ; push 9001 dec onto stack PORT (reverse byte order)
  push word 2           ; push 2 dec onto stack AF_INET

  mov ecx, esp ; move address of stack pointer into ecx

  push byte 16 ; push 16 dec onto stack (args length)
  push ecx     ; push the address of arguments onto stack
  push edi     ; puh the file descriptor onto stack

  mov ecx, esp ; move address of args into ecx
  mov ebx, 2   ; invoke subroutine BIND (2)
  mov eax, 102 ; invoke SYS_SOCKETCALL (kernel opcode 102)
  int 80h

; lession 31
_listen:
  push byte 1 ; move 1 onto stack (max queue length arg)
  push edi    ; push the file descriptor onto stack

  mov ecx, esp ; move address of args into ecx
  mov ebx, 4   ; invoke subroutine LISTEN (4)
  mov eax, 102 ; invoke SYS_SOCKETCALL (kernel opcode 102)
  int 80h

; lession 32
_accept:
  push byte 0 ; push 0 dec onto stack (address length arg)
  push byte 0 ; push 0 dec onto stack (address arg)
  push edi    ; push the file descriptor onto stack

  mov ecx, esp ; move address of args into ecx
  mov ebx, 5   ; invoke subroutine ACCEPT (5)
  mov eax, 102 ; invoke SYS_SOCKETCALL (kernel opcode 102)
  int 80h

; lession 33
_fork:
  mov esi, eax ; move returned value of SYS_SOCKETCALL ino esi (file descriptor for accepted socket)
  mov eax, 2   ; invoke SYS_FORK (kernel opcode 2)
  int 80h

  cmp eax, 0 ; if return value of SYS_FORK in eax is zero we are in the child process
  jz _read   ; jump in child process to _read

  jmp _accept ; jump in parent process to _accept

_read:
  mov edx, 255    ; number of bytes to read (we will only read the first 255 bytes for simplicity)
  mov ecx, buffer ; move the memory address of our buffer variable into ecx
  mov ebx, esi    ; move esi into ebx (accepted socket file descriptor)
  mov eax, 3      ; invoke SYS_READ (kernel opcode 3)
  int 80h

  mov eax, buffer ; move the memory address of our buffer variable into eax for printing
  call sprintLF

; lession 34
_write:
  mov edx, 79       ; move 79 dec into edx (length in bytes to write)
  mov ecx, response ; move address of our response variable into ecx
  mov ebx, esi      ; move file descriptor into ebx (accepted socket id)
  mov eax, 4        ; invoke SYS_WRITE (kernel opcode 4)
  int 80h

; lession 35
_close:
  mov ebx, esi ; move esi into ebx (accepted socket file descriptor)
  mov eax, 6   ; invoke SYS_CLOSE (kernel opcode 6)
  int 80h

_exit:
  call quit
