.model small
.stack 100h
.data
   tb1 db 10, 13, 'Nhap mot chuoi nhi phan >> $'
   tb2 db 10, 13, 'Chuoi nhi phan >> $'

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
   
   ; xu ly nhap 0 va 1
   cmp al, '0'
   je xuly
   cmp al, '1'
   je xuly
   
   ; cho dx ve 0 nhu la reset viec nhap
   ; neu nguoi dung nhap <> 0 - 1
   mov dx, 0
   jmp break
   
   xuly:
   and al, 0Fh
   shl bx, 1
   or bl, al
   
   inc cx
   
   cmp cx, 16
   jb input
   
   break:
   ret
   
   nhap endp
   
   xuat proc 
   
   mov cx, 16
   mov ah, 2
   
   print:
   mov dl, '0'
   
   rol bx, 1
   jnc print_0
   
   mov dl, '1'
   
   print_0:
   int 21h
   
   loop print 
   ret
    
   xuat endp

end