section .data ; veri girişi
    num1 dd 10 ; double değerinde veri
    num2 dd 20
    sum dd 0

section .text
    global _start ; programın başlangıç noktası

_start: 
    ; toplama işlemi
    mov eax, [num1] ; eax birincil veri için kullanılır
    mov ebx, [num2] ; ebx ikincil veri için kullanılır
    add eax, ebx ; veriler eax de toplanır
    mov [sum], eax ; veriler sum'a eklenir

    ;sonucu yazdırma
    mov eax, 4
    mov ebx, 1
    mov ecx, sum
    mov edx, 4

    int 0x80
    ; program çıkışı
    mov eax, 1
    xor ebx, ebx
    int 0x80
