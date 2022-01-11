.model small
.stack 100h
.data
   str1 db 10, 13, 'Hay nhap mot ky tu: $'
   str2 db 10, 13, 'Ky tu da nhap la: $'
   kytu db ?
.code
   ; load du lieu tu data vao ds thong qua ax
   mov ax, @data
   mov ds, ax
   
   ; xuat thong bao yeu cau nguoi dung nhap 1 ky tu
   mov ah, 9
   lea dx, str1
   int 21h     
   
   ; nhap ky tu va luu vao al
   mov ah, 1
   int 21h
   
   ; luu ki tu vua nhap vao KYTU
   mov kytu, al
   
   ; xuat thong bao ket qua
   mov ah, 9
   lea dx, str2
   int 21h
   
   ; xuat ky tu da nhap ra man hinh
   mov ah, 2
   mov dl, kytu
   int 21h
   
   ; tra quyen dieu khien lai cho he thong
   mov ah, 4ch
   int 21h
end