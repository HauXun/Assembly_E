.model small
.stack 100h
.data 
   tb1 db 10, 13, 'Nhap vao mot ky tu: $'
   tb2 db 10, 13, 'Ky tu nhap khac chu va so! $'
   tb3 db 10, 13, 'Ky tu nhap la chu$'
   tb4 db 10, 13, 'Ky tu nhap la so$'
  
.code
   ; load du lieu data vao ds thong qua ax
   mov ax, @data
   mov ds, ax
   
   ; xuat thong bao nhap
   mov ah, 9
   lea dx, tb1
   int 21h
   
   ; nhap vao 1 ky tu, ky tu nhap duoc luu vao trong al
   mov ah, 1
   int 21h
   
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
   
   ; khai bao cac nhan nhay
   khac:
   mov ah, 9
   lea dx, tb2
   int 21h
   
   jmp exit 
   
   chu:
   mov ah, 9
   lea dx, tb3
   int 21h
   
   jmp exit
   
   so:
   mov ah, 9
   lea dx, tb4
   int 21h
   
   jmp exit
   
   
   ; thoat chuong trinh 
   exit:
   ; tra quyen dieu khien lai cho he thong
   mov ah, 4ch
   int 21h

end