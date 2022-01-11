.model small
.stack 100h
.data
   tb1 db 10, 13, 'Nhap vao mot day nhi phan: $'
   tb2 db 10, 13, 'Day nhi phan vua nhap la: $'
   tbl1 db 10, 13, 'Nhap sai! Nhap lai: $'
   tbl2 db 10, 13, 'Nhap du. Ngung!$'

.code
   ; load du lieu data vao ds thong qua ax
   mov ax, @data
   mov ds, ax
   
   ; khoi tao
   reset:
   xor bx, bx
   xor cx, cx
   
   ; xuat thong bao nhap
   mov ah, 9
   lea dx, tb1
   int 21h
   
   input:
   ; nhap mot ky tu
   mov ah, 7
   int 21h
   
   ; kiem tra acsii enter
   cmp al, 0Dh  
   je break
   
   cmp al, '0' 
   je xuly
   cmp al, '1'
   je xuly
   
   ; xu ly nguoi dung nhap sai, cho nhap lai
   mov ah, 9
   lea dx, tbl1
   int 21h
   jmp reset
   
   
   ; xu ly du lieu nhap cua nguoi dung
   xuly:
   mov ah, 2
   mov dl, al
   int 21h
   
   and al, 0Fh
   shl bx, 1
   or bl, al
   
   ; tang cx va kiem tra
   inc cx  
   cmp cx, 16
   jb input
   
   ; xuat thong bao nhap du
   mov ah, 9
   lea dx, tbl2
   int 21h
   
   break:
   ; xuat ket qua
   mov ah, 9
   lea dx, tb2
   int 21h
   
   mov cx, 16
   
   ; xuat nhi phan
   print:
   rol bx, 1
   jnc print_0
   jc print_1
   
   print_0:
   mov ah, 2
   mov dl, '0'
   int 21h
   loop print 
   
   print_1:
   mov ah, 2
   mov dl, '1'
   int 21h
   loop print  
   
   ; tra quyen dieu khien lai cho he thong
   mov ah, 4ch
   int 21h

end