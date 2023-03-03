; vim:ft=nasm

; void iprint(Integer number)
; Integer printing function (itoa)
iprint:
  push eax ; preserving stuff on the
  push ecx ; stack to be
  push edx ; restored after
  push esi ; function runs

  mov ecx, 0 ; counter of how many bytes we need to print in the end

divideLoop:
  inc ecx        ; count each byte to print - number of characters
  mov edx, 0     ; empty edx
  mov esi, 10    ; move 10 into esi
  idiv esi       ; divide eax by esi
  add edx, 48    ; convert edx to its ascii representation - edx holds the remainder after a divide instruction
  push edx       ; push edx (string representation of an integer) onto the stack
  cmp eax, 0     ; can the integer be divided anymore?
  jnz divideLoop ; jump if not zero to the `divideLoop` label

printLoop:
  dec ecx      ; count down each byte that we put on the stack
  mov eax, esp ; move the stack pointer into eax for printing
  call sprint

  pop eax       ; remove last character from the stack to move `esp` forward
  cmp ecx, 0    ; have we printed all bytes we pushed onto the stack?
  jnz printLoop ; jump if not zero to the `printLoop` label

  pop esi
  pop edx
  pop ecx
  pop eax
  ret

; void iprintLF(Integer number)
; Integer printing function with linefeed (itoa)
iprintLF:
  call iprint

  push eax     ; push eax to preserve it
  mov eax, 0Ah ; move linefeed into eax
  push eax     ; push the linefeed onto the stack so we can get the address
  mov eax, esp ; move the address of the current stack pointer into eax for printing
  call sprint

  pop eax ; remove the linefeed character from the stack
  pop eax ; restore the original value of eax before this function was called
  ret

; int slen(String message)
; String length calculation function
slen:
  push ebx
  mov ebx, eax

nextchar:
  cmp byte [eax], 0
  jz finished
  inc eax
  jmp nextchar

finished:
  sub eax, ebx
  pop ebx
  ret

; void sprint(String message)
; String printing function
sprint:
  push edx
  push ecx
  push ebx
  push eax
  call slen

  mov edx, eax
  pop eax

  mov ecx, eax
  mov ebx, 1
  mov eax, 4
  int 80h

  pop ebx
  pop ecx
  pop edx
  ret

; void sprintLF(String message)
; String printing with linefeed function
sprintLF:
  call sprint

  push eax
  mov eax, 0Ah
  push eax
  mov eax, esp
  call sprint

  pop eax
  pop eax
  ret

; void exit()
; Exit program and restore resources
quit:
  mov ebx, 0
  mov eax, 1
  int 80h
  ret
