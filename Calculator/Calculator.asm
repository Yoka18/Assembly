section .data
    msg db "Result: ", 0
    len equ $ - msg

section .bss
    num1 resb 4
    num2 resb 4
    result resb 4

section .text
    global _start

_start:
    ; İlk sayıyı okur
    mov eax, 3
    mov ebx, 0
    mov ecx, num1
    mov edx, 4
    int 0x80

    ; İkinci sayıyı okur
    mov eax, 3
    mov ebx, 0
    mov ecx, num2
    mov edx, 4
    int 0x80

    ; İki sayıyı toplar
    mov eax, [num1]
    add eax, [num2]
    mov [result], eax

    ; Ekrana yazdır
    mov eax, 4
    mov ebx, 1
    mov ecx, msg
    mov edx, len
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, result
    mov edx, 4
    int 0x80

    ; Programı sonlandır
    mov eax, 1
    xor ebx, ebx
    int 0x80
