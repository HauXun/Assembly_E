                              .model small
.stack 100h
.data
   tb1 db 10, 13, 'Nhap mot chuoi thap phan >> $'
   tb2 db 10, 13, 'Chuoi thap phan >> $'

.code
   ; load du lieu data vao ds thong qua ax
   mov ax, @data
   mov ds, ax
   
   load:
   mov ah, 9
   lea dx, tb1
   int 21h
   
   call nhap
   cmp dx, 0
   je load
   
   mov ah, 9
   lea dx, tb2
   int 21h
   
   call xuat
   
   ; tra quyen dieu khien lai cho he thong
   mov ah, 4ch
   int 21h
   
   ; khoi tao procedure
   nhap proc
   
   ; reset            
   mov dx, 1
   xor bx, bx
   xor cx, cx
   
   input:
   ; nhap vao mot ky tu
   mov ah, 1
   int 21h
   
   ; xu ly loi thoat => enter
   cmp al, 0Dh
   je break 
   
   ; xu ly nhap hexa
   cmp al, '0'
   jb err
   cmp al, '9'
   jbe so
   
   cmp al, 'A'
   jb err
   cmp al, 'F'
   jbe chu
   
   ; cho dx ve 0 nhu la reset viec nhap
   ; neu nguoi dung nhap <> hexa
   err:
   mov dx, 0
   xor bx, bx
   jmp break
   
   so:
   and al, 0Fh
   jmp xuly
   
   chu:
   sub al, 37h
   
   xuly:
   shl bx, 4
   or bl, al
   
   inc cx
   
   cmp cx, 4
   jb input
   
   break:
   ret
   
   nhap endp
   
   xuat proc 
   
   mov cx, 4
   mov ah, 2
   
   print:
   mov dl, bh
   
   shr dl, 4
   cmp dl, 9
   jbe print_so
   ja print_chu
   
   print_so:
   or dl, 30h
   int 21h
   jmp back
   
   print_chu:
   add dl, 37h
   int 21h
   
   back:
   rol bx, 4
   loop print 
   ret
    
   xuat endp

end