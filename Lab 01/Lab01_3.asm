.model small
.stack 100h
.data
   str1 db 10, 13, 'Hay nhap mot ky tu: $'
   str2 db 10, 13, 'Ky tu dung truoc: $'
   str3 db 10, 13, 'Ky tu dung sau: $'
   kytunhap db ?
.code
   ; load du lieu data vao ds thong qua ax
   mov ax, @data
   mov ds, ax
   
   ; xuat thong bao nhap 1 ky tu
   mov ah, 9
   lea dx, str1
   int 21h
   
   ; nhap 1 ky tu
   mov ah, 1
   int 21h                        
   
   ; luu vao trong al       
   mov kytunhap, al
   
   ; xuat thong bao ky tu dung truoc
   mov ah, 9
   lea dx, str2
   int 21h
   
   ; xuat ky tu dung truoc
   mov dl, kytunhap
   dec dl
   mov ah, 2
   int 21h
   
   ; xuat thong bao ky tu dung sau
   mov ah, 9
   lea dx, str3
   int 21h
   
   ; xuat ky tu dung sau
   mov dl, kytunhap   
   inc dl
   mov ah, 2
   int 21h
   
   ; tra quyen dieu khien lai cho he thong
   mov ah, 4ch
   int 21h
end