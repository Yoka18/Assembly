section .data
  msg db "Hello Wold", 0
  
 global _start
 
 _start:
  mov eax, 4 ; system call
  mov ebx, 1 ; stdout dosya tanımlayıcısı 
  mov ecx, msg
  mov edx, 13 ; mesajın uzunluğu kadar
  
  int 0x80 ; sistem çağrısı yap
  mov eax, 1 ; sistemi sonlandır
  xor ebx, ebx ;
  int 0x80
