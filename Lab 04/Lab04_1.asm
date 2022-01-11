.model small
.stack 100h
.data
   tb1 db 10, 13, 'Nhap vao mot chuoi: $'
   tb2 db 10, 13, 'Chuoi duoc dao nguoc: $'
   
.code
   ; load du lieu data vao ds thong qua ax
   mov ax, @data
   mov ds, ax
   
   ; xuat thong bao nhap
   mov ah, 9
   lea dx, tb1
   int 21h
   
   xor cx, cx 
   input:
   mov ah, 1
   int 21h
   
   cmp al, 1Bh
   je break
   
   push ax
   inc cx
   
   jmp input
   
   break:
   ; xuat thong bao chuoi dao nguoc
   mov ah, 9
   lea dx, tb2
   int 21h
   
   mov ah, 2
   print:
   pop dx
   int 21h
   loop print
   
   ; tra quyen dieu khien lai cho he thong
   mov ah, 4ch
   int 21h

end