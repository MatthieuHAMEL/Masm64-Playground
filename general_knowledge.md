# General knowledge 

## I - x86-64 CPUs architecture overview

```
CPU ----- Memory
 |      / 
 |     /    
IO devices
```

- **CPU** puts an address in the **Address Bus** to get data from {**Memory** | **IO**} at that address. 
- Then {**CPU** | **Memory** | **IO**} put data in the **Data Bus**
- The **Control Bus** controls the orientation of the transfer.

## II - Registers 

https://cs.brown.edu/courses/cs033/docs/guides/x64_cheatsheet.pdf

```
8B   4B    2B    1B     1B (bits 8-15)
%rax %eax  %ax   %al    %ah
%rbx %ebx  %bx   %bl    %bh
%rcx %ecx  %cx   %cl    %ch
%rdx %edx  %dx   %dl    %dh
%rsi %esi  %si   %sil 
%rdi %edi  %di   %dil 
%rsp %esp  %sp   %spl
%rbp %ebp  %bp   %bpl 
%r8  %r8d  %r8w  %r8b 
%r9  %r9d  %r9w  %r9b 
%r10 %r10d %r10w %r10b 
%r11 %r11d %r11w %r11b 
%r12 %r12d %r12w %r12b 
%r13 %r13d %r13w %r13b 
%r14 %r14d %r14w %r14b 
%r15 %r15d %r15w %r15b
```

RSP = stack pointer 
RBP = frame pointer, used with RSP ...

What is important is that the registers are overlaid ; 4B registers are on the first 
4B of the 8B registers ; 2B registers are on the first 2B of the 8B registers, 1B registers 
are on the first byte of 8B registers. The 4 registers AH -> DH are on the second byte.

+ 8 floating-point registers : ST(0) -> ST(7) of 80 bits each 
... in the FPU (Floating Point Unit)

+ 16 XMM registers of 128 (256 more recently) bits each (XMM0 -> XMM15)

+ **RFLAGS** : a 64 bits register mostly uninteresting in user-space, 
with 1 bit values : those interesting are :

- overflow
- carry 
- sign 
- zero 
... among a few others ... 

### III - Memory