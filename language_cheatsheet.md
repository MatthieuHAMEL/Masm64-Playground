### A few variables declarations 

```
 .data
my_u8 byte  15
my_i8 sbyte 250    ; signed 8 bits, wrap-around 
myString byte 'H', 'e', 'l', 'l', 'o', 0              
myString byte 'Hello', 0

; A constant 
dataSize = 256
```

### Use a function from C

```
externdef  printf:proc
```

### Pass parameters 

MS ABI :

- Calling a procedure : 
    - put integer / pointer values in RCX, RDX, R8, R9 (in that order)
    - floating point values in XMM0 to XMM3
e.g. for printf 
```
myString byte 'Hello, World!', 0
lea RCX myString
call printf
```

- Retval in RAX if integer or pointer. If integer is smaller than 64b, 
the upper (last) bits of the register are undefined. 
- Retval in XMM0 for floating point values 


### Volatile vs nonvolatile registers 

- Volatile : RAX, RCX, RDX, R8, R9, R10, R11, X(Y)MM0 -> XMM5
- Nonvolatile : RBX, RBP, RDI, RSP, R12, R13, R14, R15, XMM6 -> XMM15.  

Volatile registers are allowed to change during a procedure call. 
Nonvolatile registers must not change during a procedure call (or they must 
be restored at the end) - otherwise it violates the MS ABI. 


