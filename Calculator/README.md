# How to run
### Requirement
-NASM
-Binutils(GNU Linker)

## Compile with NASM
````bash
nasm -f elf64 calculator.asm -o calculator.o
````
## Link object file with LD
````bash
ld -o calculator calculator.o
````
## Run the file
````bash
./calculator
````
