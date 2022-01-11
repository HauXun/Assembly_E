.model small
.stack 100h
.data
   tb1 db 10, 13, 'Nhap vao 1 chu cai thuong: $'
   tb2 db 10, 13, 'Chu hoa tuong ung la: $'
   kytu db ?

.code
   ; load du lieu data vao ds thong qua ax
   mov ax, @data
   mov ds, ax
   
   input:
   ; xuat thong bao nhap
   mov ah, 9
   lea dx, tb1
   int 21h
   
   ; nhap 1 ky tu
   mov ah, 7 
   int 21h
   
   cmp al, 'a'
   jb input
   cmp al, 'z'
   ja input
   
   mov kytu, al
   
   ; xuatthong bao ket qua
   mov ah, 9
   lea dx, tb2
   int 21h
   
   ; xuat ky tu hoa
   mov dl, kytu
   sub dl, 20h
   mov ah, 2
   int 21h
   
   
   ; tra quyen dieu khien lai cho he thong
   mov ah, 4ch
   int 21h

end