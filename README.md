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

### Questions
- **Can 64-bit computer run x86 programs?**  
  if not: why my x86 asm codes run?

- **Why do not we indent stuff inside sections?**:  
  It would require indenting a lot of stuff, for not that much readability gain.

- **What is the text section used for than just for `global _start`**:  
  The `.text` section contains all the actual executable code.

- **Will the variables we create in `.data` and `.bss` really be in these sections in the memory or the compiler will change it?**:  
  Yes, they will be. Assemblers don't really much with your code like a C compiler would.

- lesson 1
  - **What is "the library"?**
  - **Why `0Ah` have a "h" character? is it hexadecimal?**:  
    Yes. They use "h" as a style choice. It is also valid to use 0x as a prefix.

- lesson 5
  - **Why do we have to use `ret` in the end of the `quit` function?**: I do not think thats necessary.

- lesson 7
  - **what exactly are linefeeds?**:  
    Mew line characters - `'\n'`

- lesson 9
  - **What is the difference between reserved in unreserved spaces in the memory?**  
  **I mean how my program knows that space is reserved?**:  
   "Reserved space" isn't really something that makes sense at runtime.  When its reserving space, its just increasing the size of the current section. At runtime, the program just refers to those sections of memory.

- lesson 22
  - **What is that `o` in `0777o`?**:  
    It marks it as an octal number.

- lesson 23
  - **Why do I need root permission to read the created file?**

- lesson 29
  - **What does `xor` means?**:  
    `xor` is exclusive or. When working with bits, it outputs a 1 if either of the input bits is 1, but not both of them, and a zero if both are 1, or both are 0.

  - **Why `xor eax, eax` sets the `eax`'s value 0?**:  
    Because if two bits are equal, then the output is always zero.
  - **What is a socket?**:  
    A Unix abstraction for networking.

- lesson 36
  - **If everything in Linux is a file, it means web sockets too... How would I handle web sockets in Windows if Windows doesn't deal with connections as they were files?**
  - **Why we used in this class `0Dh, 0Ah` to create a new line instead of just `0Ah` (linefeed character)?**:  
    That's "\r\n", which is how windows typically represents new lines.

### opcodes
  <!-- I don't know what is this link for:
    https://chromium.googlesource.com/chromiumos/docs/+/HEAD/constants/syscalls.md#x86-32_bit
  -->
  [for Linux x68 64](https://blog.rchapman.org/posts/Linux_System_Call_Table_for_x86_64)
