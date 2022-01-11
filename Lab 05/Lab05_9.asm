.model small
.stack 100h
.data

    tb1 db 10,13, 'Nhap vao 1 day thap luc phan >> $'
    tb2 db 10,13, 'Ki tu dau tien trong day hexa >> $'

.code
    ; load du lieu data vao ds thong qua ax
    mov ax, @DATA
    mov ds, ax    
    
    reset:         
        ; xuat thong bao nhap
        mov ah, 9
        lea dx, tb1
        int 21h
        
        ; reset thanh ghi
        xor bx, bx
        xor cx, cx
    
    input:
        mov ah, 1
        int 21h
        
        ; kiem tra loi thoat
        cmp al, 0Dh
        je break
        
        cmp al, '0'
        jb err
        cmp al, '9'
        jbe so
        cmp al, 'A'
        jb err
        cmp al, 'F'
        jbe chu
        
        err:
            jmp reset
            
        so:    
            and al, 0Fh
            jmp xuly
        
        chu:
            sub al, 37h
            
        xuly:
            shl bx, 4
            or bl, al
            
            inc cx
            
        ; Kiem tra cx va thoat chuong trinh
        cmp cx, 4
        jb input
    
    break:
        ; Xuat thong bao ket qua
        mov ah, 9
        lea dx, tb2
        int 21h
        
        mov cx, 4
        
        mov dl, bh
        shr dl, 4
        
        cmp dl, 9
        jbe pSo
        ja pChu
        
        pSo:
            mov ah, 2 
            or dl, 30h
            int 21h
            jmp exit
                
        pChu:
            mov ah, 2
            add dl, 37h
            int 21h
   
    exit:
    ; tra quyen dieu khien lai cho he thong
    mov ah, 4Ch
    int 21h
end