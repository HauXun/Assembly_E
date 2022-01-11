.model small
.stack 100h
.data
   tb db 10, 13, 'tat cac chu hoa theo ACSII: $'

.code
   ; load du lieu data vao ds thong qua ax
   mov ax, @data
   mov ds, ax
   
   alphabet:
   ; thong bao xuat
   mov ah, 9
   lea dx, tb
   int 21h
   
   ; loop de xuat ky tu acsii
   mov cx, 26
   mov dl, 'A'
   
   xuat:    
   ; xuat 1 ky tu
   mov ah, 2     
   int 21h
   inc dl
   loop xuat
   
   
   ; thoat chuong trinhf
   mov ah, 4ch
   int 21h

end