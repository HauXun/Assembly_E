.model small
.stack 100h
.data
    tb1 db 10,13, 'Nhap chieu dai >> $'
    tb2 db 10,13, 'Nhap chieu rong >> $'
    tb3 db 10,13, 'Dien tich >> $'
    tb4 db 10,13, 'chu vi >> $'
    
    dai dw ?
    rong dw ?
.code
    mov ax, @data
    mov ds, ax
    
    ; Nhap chieu dai
    nhap_dai:
        ; xuat thong bao nhap chieu dai
        lea dx, tb1
        call printf
        
        call nhap
        cmp dx, 0
        je nhap_dai
    
    mov dai, bx
    
    ; Nhap chieu rong
    nhap_rong:
        ; xuat thong bao nhap chieu rong
        lea dx, tb2
        call printf
        
        call nhap
        cmp dx, 0
        je nhap_rong
        
    mov rong, bx
    
    ; Gan gia tri vao bx, cx
    mov bx, dai
    mov cx, rong
    
    ; Xuat thong bao ket qua tinh dien tich
    lea dx, tb3
    call printf
    
    ; tinh dien tich
    call dien_tich
    ; xuat dien tich
    call xuat
    
    ; Xuat thong bao ket qua tinh chu vi
    lea dx, tb4
    call printf
    
    ; tinh chu vi
    call chu_vi
    ; xuat chu vi
    call xuat
    
    mov ah, 4ch
    int 21h

    ; procedure ngat lenh xuat
    printf proc
        mov ah, 9
        int 21h
        ret
    printf endp
    
    nhap proc
        ; reset thanh ghi
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

    ; procedure tinh dien tich  
    dien_tich proc
        mov ax, bx
        mul cx
        ret
    dien_tich endp

    ; procedure tinh chu vi
    chu_vi proc
        push bx
        
        add bx, cx
        mov ax, 2
        mul bx
        
        pop bx
        ret
    chu_vi endp
END