.model small
.stack 100h
.data
   str1 db 10, 13, 'Nhap vao mot ky tu: $'
   str2 db 10, 13, 'Ky tu dung truoc: $'
   str3 db ', ky tu da nhap: $'
   str4 db ', ky tu dung sau: $'
   kytunhap db ?

.code      
   ; load du lieu data vao ds thong qua ax
   mov ax, @data
   mov ds, ax
   
   ; xuat thong bao nhap
   mov ah, 9
   lea dx, str1
   int 21h

   ; nhap mot ky tu
   mov ah, 1
   int 21h
   
   ; ky tu vua nhap duoc luu trong al
   mov kytunhap, al
   
   ; xuat thong bao ky tu dung truoc
   mov ah, 9
   lea dx, str2
   int 21h
   
   ; xuat ky tu dung truoc
   mov ah, 2
   mov dl, kytunhap
   dec dl
   int 21h
   
   ; xuat thong bao ky tu da nhap
   mov ah, 9
   lea dx, str3
   int 21h
   
   ; xuat ky tu da nhap
   mov ah, 2
   mov dl, kytunhap
   int 21h
   
   ; xuat thong bao ky tu dung sau
   mov ah, 9
   lea dx, str4
   int 21h
   
   ; xuat ky tu dung sau
   mov ah, 2
   mov dl, kytunhap
   inc dl
   int 21h
   
   ; tra quyen dieu khien lai cho he thong
   mov ah, 4ch
   int 21h
end