# Bring ml64 assembler
(in a shortcut, for example) 
```
cmd /k 
"C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build\vcvars64.bat"
```

# Build a single asm file as an exe 
If the main function is called "main":
```
ml64 sample.asm /link /subsystem:console /entry:main
```
-> output: sample.exe

# Compile only & link with a C++ object file 
```
ml64 /c sample.asm
```
-> output: sample.obj

```
cl main.cpp sample.obj
```
-> output: main.exe





