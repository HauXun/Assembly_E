.model small
.stack 100h
.data
   tb1 db 10, 13, 'Nhap vao mot chu thuong: $'
   tb2 db 10, 13, 'Chu hoa >> $'

.code
   ; load du lieu data vao ds thong qua ax
   mov ax, @data
   mov ds, ax
   
   input:
   ; xuat thong bao nhap
   mov ah, 9
   lea dx, tb1
   int 21h
   
   mov ah, 1
   int 21h
   
   cmp al, 1Bh
   je exit
   
   cmp al, 'a'
   jb input
   cmp al, 'z'
   ja input
   
   mov bl, al
   
   ; xuat thong bao ket qua
   mov ah, 9
   lea dx, tb2
   int 21h
   
   call HOA
   jmp input 
   
   exit:
   ; tra quyen dieu khien lai cho he thonh
   mov ah, 4ch
   int 21h
   
   HOA proc
    mov dl, bl
    sub dl, 20h
    
    mov ah, 2
    int 21h
    ret
    
   HOA endp

end