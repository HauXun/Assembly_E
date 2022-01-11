.model small
.stack 100h
.data
   tb1 db 10, 13, 'Nhap mot ky tu: $'
   tb2 db 10, 13, '5 ky tu truoc: $'
   tb3 db 10, 13, '5 ky tu dung sau: $'
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
   
   ; xuat thong bao 5 ky tu sau
   mov ah, 9
   lea dx, tb3
   int 21h
   
   
   mov dl, input
   inc dl
   mov cx, 5
   mov ah, 2
   ; tao co lap
   print:
   
   int 21h 
   inc dl
   loop print
   
   ; xuat thong bao 5 ky tu truoc
   mov ah, 9
   lea dx, tb2
   int 21h
   
   
   mov dl, input
   sub dl, 5
   mov cx, 5
   mov ah, 2
   ; tao co lap
   print2:
   
   int 21h 
   inc dl
   loop print2
   
   ;tra quyen dieu khien lai cho he thong
   mov ah, 4ch
   int 21h

end