.model small
.stack 100h
.data
    tb1 db 10,13, 'Nhap vao so thu nhat >> $'
    tb2 db 10,13, 'Nhap vao so thu hai  >> $'
    
    tb3 db 10,13, 'Tong >> $'
    tb4 db 10,13, 'Hieu >> $'
    tb5 db 10,13, 'Tich >> $'
    tb6 db 10,13, 'Thuong >> $'
    
    n1 dw ?
    n2 dw ?
    
.code                         
    mov ax, @data
    mov ds, ax
    
    ; Nhap so thu nhat
    input_1:
        lea dx, tb1
        call printf
        
        call nhap
        cmp dx, 0
        je input_1
        
    mov n1, bx
    
    ; Nhap so thu hai
    input_2:
        lea dx, tb2
        call printf
        
        call nhap
        cmp dx, 0
        je input_2
        
    mov n2, bx
    
    ; Xuat tong
    lea dx, tb3
    call printf
    
    mov ax, n1
    mov bx, n2
    add ax, bx
    call xuat
    
    ; Xuat hieu
    lea dx, tb4
    call printf
    
    mov ax, n1
    mov bx, n2
    sub ax, bx
    mov cx, ax    
    
    js xuat_am
    jmp xuat_kq
    
    xuat_am:
        mov ah, 2
        mov dl, '-'
        int 21h
        
        neg cx
        mov ax, cx
    
    xuat_kq:
        call xuat
    
    ; Xuat tich
    lea dx, tb5
    call printf
    
    mov ax, n1
    mov bx, n2
    mul bx    
    call xuat
    
    ; Xuat thuong
    lea dx, tb6
    call printf
        
    xor dx, dx
    mov ax, n1
    mov bx, n2
    div bx
    call xuat
    
                           
    mov ah, 4ch
    int 21h                               
    
    printf proc
        push ax        
        mov ah, 9
        int 21h          
        pop ax
        ret
    printf endp
    
    nhap proc
        xor bx, bx
        
        input:
            mov ah, 1
            int 21h
            
            cmp al, 0Dh
            je break
            
            cmp al, '0'
            jb err
            cmp al, '9'
            ja err
            
            and al, 0Fh
            mov cl, al
            xor ch, ch
            
            mov ax, bx
            mov si, 10
            mul si
            mov bx, ax
            add bx, cx
            
            jmp input
            
            err:
                xor bx, bx
                mov dx, 0
                jmp exit
        
        break:
            mov dx, 1
        
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
END