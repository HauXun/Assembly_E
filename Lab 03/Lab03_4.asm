.model small
.stack 100h
.data
   tb1 db 10, 13, 'Nhap mot ky tu: $'
   tb2 db 10, 13, '5 ky tu tiep: $'
   input db ?

.code 
   ; load du lieu data vao ds thong qua ax
   mov ax, @data
   mov ds, ax
   
   ; xuat thong bao nhap 1 ky tu
   mov ah, 9
   lea dx, tb1
   int 21h
   
   ; nhap 1 ky tu
   mov ah, 1
   int 21h
   
   mov input, al
   
   ; xuat thong bao ket qua
   mov ah, 9
   lea dx, tb2
   int 21h
   
   ; gan so lan lap
   mov cx, 5
   
   ; tao co lap
   print:
   inc input
   
   mov ah, 2
   mov dl, input
   int 21h
   
   loop print
   
   ;tra quyen dieu khien lai cho he thong
   mov ah, 4ch
   int 21h

end