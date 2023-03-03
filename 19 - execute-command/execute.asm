; vim:ft=nasm

%include 'functions.asm'

section .data
command     db '/bin/echo', 0h     ; command to execute
arg1        db 'Hello, World!', 0h

arguments   dd command
            dd arg1 ; args to pass the commandline (in this case just one)
            dd 0h   ; end the struct
environment dd 0h   ; args to pass as environment variables (in this case none) end the struct

section .text
global _start

_start:
  mov edx, environment ; address of environment variables
  mov ecx, arguments   ; address of the arguments to pass to the commandline
  mov ebx, command     ; address of the file to execute
  mov eax, 11          ; invoke SYS_EXECVE (kernel opcode 11)
  int 80h

  call quit
