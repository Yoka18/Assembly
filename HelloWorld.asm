section .data
  msg db "Hello Wold", 0
  
 global _start
 
 _start:
  mov eax, 4 ; system call 4 yazdır
  mov ebx, 1 ; stdout dosya tanımlayıcısı 
  mov ecx, msg
  mov edx, 13 ; mesajın uzunluğu kadar
  
  int 0x80 ; sistem çağrısı yap
  mov eax, 1 ; sistemi 1 ile sonlandır
  xor ebx, ebx ;
  int 0x80
