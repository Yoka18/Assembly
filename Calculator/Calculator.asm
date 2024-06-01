section .data
    msg db "Result: ", 0
    len equ $ - msg
    newline db 10, 0

section .bss
    num1 resb 4
    num2 resb 4
    result resb 4

section .text
    global _start

_start:
    ; İlk sayıyı oku
    mov eax, 0          ; sys_read (0)
    mov edi, 0          ; stdin (0)
    lea rsi, [num1]     ; buffer
    mov edx, 4          ; buffer length
    syscall             ; call kernel

    ; İkinci sayıyı oku
    mov eax, 0          ; sys_read (0)
    mov edi, 0          ; stdin (0)
    lea rsi, [num2]     ; buffer
    mov edx, 4          ; buffer length
    syscall             ; call kernel

    ; Karakterleri sayılara dönüştür
    movzx eax, byte [num1]
    sub eax, '0'
    movzx ebx, byte [num2]
    sub ebx, '0'

    ; İki sayıyı topla
    add eax, ebx

    ; Sayıyı tekrar karaktere çevir
    add eax, '0'
    mov [result], al

    ; Sonucu ekrana yazdır (mesaj)
    mov eax, 1          ; sys_write (1)
    mov edi, 1          ; stdout (1)
    lea rsi, [msg]      ; message
    mov edx, len        ; message length
    syscall             ; call kernel

    ; Sonucu ekrana yazdır (değer)
    mov eax, 1          ; sys_write (1)
    mov edi, 1          ; stdout (1)
    lea rsi, [result]   ; result
    mov edx, 1          ; result length
    syscall             ; call kernel

    ; Yeni satır yazdır
    mov eax, 1          ; sys_write (1)
    mov edi, 1          ; stdout (1)
    lea rsi, [newline]  ; newline
    mov edx, 1          ; newline length
    syscall             ; call kernel

    ; Programı sonlandır
    mov eax, 60         ; sys_exit (60)
    xor edi, edi        ; return 0
    syscall             ; call kernel
