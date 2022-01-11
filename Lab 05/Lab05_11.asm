.model small
.stack 100h
.data
    tb1 db 10,13, 'Nhap vao so thu nhat >> $'
    tb2 db 10,13, 'Nhap vao so thu hai >> $'
    tb3 db 10,13, 'Ket qua cua phep chia >> $'
    tb4 db 10,13, 'Phan thuong >> $'
    tb5 db 10,13, 'Phan du >> $'    
    
    num1 dw ?
    num2 dw ?
    
.code
    ; load du lieu data vao ds thong qua ax
    mov ax, @data
    mov ds, ax
    
    ; reset cac thanh ghi 
    xor ax, ax
    xor bx, bx
    xor cx, cx
    xor dx, dx
    
    ; Xuat thong bao nhap so thu nhat
    lea dx, tb1
    call printf
    
    ; Nhap so thu nhat
    call nhap
    mov num1, bx
    
    ; Xuat thong bao nhap so thu hai
    lea dx, tb2
    call printf
    
    ; Nhap so thu hai
    call nhap
    mov num2, bx
    
    ; Xuat thong bao ket qua
    lea dx, tb3
    call printf
    mov ax, num1
    call xuat
    
    mov ah, 2
    mov dl, '/'
    int 21h
    
    mov ax, num2
    call xuat
    
    ; chia 2 so
    xor dx, dx
    mov ax, num1
    mov cx, num2
    div cx
    
    mov bx, ax ; Phan thuong luu tren bx
    mov cx, dx ; Phan du luu tren cx
    
    ; Xuat ket qua phan thuong voi phan du
    lea dx, tb4
    call printf
    
    mov ax, bx
    call xuat
    
    lea dx, tb5
    call printf
    
    mov ax, cx
    call xuat                
    ; tra quyen dieu khien lai cho he thong
    mov ah, 4ch
    int 21h
             
    printf proc
        mov ah, 9
        int 21h
        ret     
        
    printf endp

    nhap proc
        xor bx, bx
        
        input:
            mov ah, 7
            int 21h
            
            cmp al, 0Dh
            je exit
            
            cmp al, '0'
            jb err
            cmp al, '9'
            ja err
            
            mov cl, al
            
            mov ah, 2
            mov dl, cl
            int 21h
            
            and cl, 0Fh
            
            mov ax, bx
            mov dx, 10
            mul dx
            
            mov bx, ax
            xor ch, ch
            add bx, cx
            
            err:
            jmp input
            
        exit:   
            ret
    nhap endp
                                     
    xuat proc
        mov bx, 10
        xor cx, cx
        
        push_stack:
            xor dx, dx
            div bx
            push dx
            inc cx
            
            cmp ax, 0
            ja push_stack
            
        print:
            pop dx
            or dx, 30h
            mov ah, 2
            int 21h
            loop print            
                                 
        ret
    xuat endp

end