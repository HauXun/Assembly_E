.model small
.stack 100h
.data
   tb1 db 10, 13, 'Bay gio la sang, chieu hay toi?: $'
   kq1 db 10, 13, 'Chao buoi sang!$'
   kq2 db 10, 13, 'Chao buoi chieu!$'
   kq3 db 10, 13, 'Chao buoi toi!$'

.code
   ; load du lieu data vao ds thong qua ax
   mov ax, @data
   mov ds, ax
   
   ; tao nhan
   INPUT:
   ; Xuat thong bao nhap 1 ky tu
   mov ah, 9
   lea dx, tb1
   int 21h
   
   ; nhap vao 1 ky tu
   mov ah, 1
   int 21h
   
   ; so sanh ky tu
   cmp al, 'S'
   je SANG
   cmp al, 's'
   je SANG
   
   cmp al, 'C'
   je TRUA
   cmp al, 'c'
   je TRUA
   
   cmp al, 'T'
   je TOI
   cmp al, 't'
   je TOI
   
   jmp INPUT
   
   ; khoi tao cac nhan nhay
   SANG:
   mov ah, 9
   lea dx, kq1
   int 21h
   
   jmp EXIT
   
   TRUA:
   mov ah, 9
   lea dx, kq2
   int 21h
   
   jmp EXIT
   
   TOI:
   mov ah, 9
   lea dx, kq3
   int 21h
   
   jmp EXIT
   
   ; khoi tao loi thoat
   EXIT:  
   ; tra quyen dieu khien lai cho he thong
   mov ah, 4ch
   int 21h
end