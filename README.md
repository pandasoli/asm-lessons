### if not see later, search:
- rsp register
- edi register

### registers:
`eax`: accumulator register / general purpose register
`ebx`: base register
`ecx`: counter register  
`edx`: data register

`esi`: source register
`edi`: destination index

### questions
- can 64-bit computer run x86 programs?  
  if not: why my x86 asm codes run?
- why do not we indent stuff inside sections
- what is the text section used for than just for `global _start`
- will the variables we create in `.data` and `.bss` really be in these sections in the memory

- lesson 1
  - what is "the library"?
  - why `0Ah` have a "h" character? is it hexadecimal?
    if yes: why don't we use `0x` instead?

- lesson 5
  - why do we have to use `ret` in the end of the `quit` function?

- lesson 7
  - **what exactly are linefeeds?**: new line characters - `'\n'`

- lesson 9
  - what is the difference between reserved in unreserved spaces in the memory?  
  I mean how my program knows that space is reserved?

- lesson 22
  - what is that `o` in `0777o`?

- lesson 23
  - why do I need root permission to read the created file?

- lesson 29
  - what does `xor` means?
  - why `xor eax, eax` sets the `eax`'s value 0?
  - what is a socket?

- lesson 36
  - if everything in Linux is a file, it means web sockets too... How would I handle web sockets in Windows if Windows doesn't deal with connections as they were files?
  - why we used in this class `0Dh, 0Ah` to create a new line instead of just `0Ah` (linefeed character)?

### opcodes
  <!-- I don't know what is this link for:
    https://chromium.googlesource.com/chromiumos/docs/+/HEAD/constants/syscalls.md#x86-32_bit
  -->
  [for Linux x68 64](https://blog.rchapman.org/posts/Linux_System_Call_Table_for_x86_64)

### Stopped
Reading these:
- https://en.wikipedia.org/wiki/File_descriptor
- https://man7.org/linux/man-pages/man2/open.2.html
But I did read yet
