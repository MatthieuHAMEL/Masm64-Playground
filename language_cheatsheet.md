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

- Put the values in RCX, RDX, R8, R9 (in that order)

e.g. for printf 
```
myString byte 'Hello, World!', 0
lea RCX myString
call printf
```

- Retval in RAX if integer or pointer