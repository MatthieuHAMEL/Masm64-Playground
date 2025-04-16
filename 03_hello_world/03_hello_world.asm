.data
myString byte 'Hello World!', 10, 0    ; 10 is for newline

.code 
option  casemap:none                        ; so that asmFunc != asmfunc
externdef  printf:proc

public  asmFunc
asmFunc PROC
	sub rsp, 56                             ; I accept it for now

	lea rcx, myString
	call printf

	add rsp, 56                             ; ... same
	ret
asmFunc ENDP

END
