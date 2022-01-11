.model small
.stack 100h
.data
   tb1 db 10, 13, 'Nhap mot ky tu: $'
   tb2 db 10, 13, 'Ky tu da nhap la chu$'
   tb3 db 10, 13, 'Ky tu da nhap la so$'
   tb4 db 10, 13, 'Ky tu da nhap khac chu/so$'
   
   kytunhap db ?

.code
   ; load du lieu data vao ds thong qua ax
   mov ax, @data
   mov ds, ax 
   
   call CreateString
   
   ; tra quyen dieu khien lai cho he thong
   mov ah, 4ch
   int 21h
   
   ; khoi tao procedure
   CreateString proc
   input:
   ; xuat thong bao nhap
   mov ah, 9
   lea dx, tb1
   int 21h
   
   ; nhap vao mot ky tu
   mov ah, 1
   int 21h
   
   ; kiem tra loi thoat
   cmp al, 1Bh
   je exit
   
   cmp al, '0'
   jb khac
   cmp al, '9'
   jbe so
   
   cmp al, 'A'
   jb khac
   cmp al, 'Z'
   jbe chu
   
   cmp al, 'a'
   jb khac
   cmp al, 'z'
   jbe chu
   
   chu:
   mov ah, 9
   lea dx, tb2
   int 21h
   jmp input
   
   so:
   mov ah, 9
   lea dx, tb3
   int 21h
   jmp input
   
   khac:
   mov ah, 9
   lea dx, tb4
   int 21h
   jmp input
   
   exit:
   ret
   
   CreateString endp

end