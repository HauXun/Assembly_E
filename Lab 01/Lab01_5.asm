.model small
.stack 100h
.data
   str1 db 10, 13, 'Nhap ky tu thu nhat: $'
   str2 db 10, 13, 'Nhap ky tu thu hai: $'
   str3 db 10, 13, 'Ky tu tong: $'
   kytunhap1 db ?
   kytunhap2 db ?
   tong db ?

.code
   ; load du lieu data vao ds thong qua ax
   mov ax, @data
   mov ds, ax
   
   ; xuat thong bao nhap ky tu thu nhat
   mov ah, 9
   lea dx, str1
   int 21h   
   
   ; nhap ky tu thu nhat
   mov ah, 1
   int 21h
   
   ; du lieu nhap duoc luu trong al
   mov kytunhap1, al
   
   ; xuat thong bao nhap ky tu thu hai
   mov ah, 9
   lea dx, str2
   int 21h 
   
   ; nhap ky tu thu hai
   mov ah, 1
   int 21h
   
   ; du lieu nhap duoc luu trong al
   mov kytunhap2, al 
   
   ; xuat thong bao ky tu tong
   mov ah, 9
   lea dx, str3
   int 21h
   
   mov al, kytunhap1
   mov bl, kytunhap2       
   add al, bl
   mov tong, al
   
   ; xuat ky tu tong
   mov ah, 2
   mov dl, tong
   int 21h
   
   ; tra quyen dieu hien lai cho he thong
   mov ah, 4ch
   int 21h
end