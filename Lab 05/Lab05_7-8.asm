.model smallL
.stack 100h
.data
    tb_thu   db 10,13, 'Hom nay la >> $'
    tb_ngay  db 10,13, 'ngay >> $'
    tb_thang db 10,13, 'thang >> $'
    tb_nam   db 10,13, 'nam >> $'
    
    tb_gio   db 10,13, 'gio >> $'
    tb_phut  db 10,13, 'phut >> $'
    tb_giay  db 10,13, 'giay >> $'
    
    thu_hai db 'Thu Hai$'
    thu_ba  db 'Thu Ba$'
    thu_tu  db 'Thu Tu$'
    thu_nam db 'Thu nam$'
    thu_sau db 'Thu Sau$'
    thu_bay db 'Thu Bay$'
    chunhat db 'Chu Nhat$'
    
    ngay  db ?
    thang db ?
    nam   dw ?
    thu   db ?
    
    gio   db ?
    phut  db ?
    giay  db ?
    
.code
    ; load du lieu data vao ds thong qua ax
    mov ax, @data
    mov ds, ax
    
    ; reset cac thanh ghi
    xor ax, ax
    xor bx, bx
    xor cx, cx
    xor dx, dx
                           
    ; su dung ham ngat de lay ngay thang nam
    mov ah, 2ah
    int 21h
    
    ; ghi cac gia tri tuong ung vao cac offset
    mov ngay, dl
    mov thang, dh
    mov nam, cx
    mov thu, al
    
    ; Xuat thong bao thu ngay
    lea dx,  tb_thu
    call printf
    
    mov bl, thu
    call xuat_ngay
    
    ; Xuat thong bao ngay
    lea dx,  tb_ngay
    call printf
    
    xor ah, ah
    mov al, ngay ; ax = ah | al 
    call xuat_time
    
    
    ; Xuat thong bao thang
    lea dx,  tb_thang
    call printf
    
    xor ah, ah
    mov al, thang
    call xuat_time
    
    ; Xuat thong bao nam
    lea dx,  tb_nam
    call printf
    
    mov ax, nam
    call xuat_time
    
    
    ; LAY gio/ phut/ giay CUA HE THONG
    mov ah, 2ch
    int 21h
    
    mov gio, ch
    mov phut, cl
    mov giay, dh
    
    ; Xuat thong bao gio cua he thong
    lea dx,  tb_gio
    call printf
    
    xor ah, ah
    mov al, gio
    call xuat_time
    
    ; Xuat thong bao phut cua he thong
    lea dx,  tb_phut
    call printf
    
    xor ah, ah
    mov al, phut
    call xuat_time
    
    ; Xuat thong bao giay cua he thong
    lea dx,  tb_giay
    call printf
    
    xor ah, ah
    mov al, giay
    call xuat_time
    
    ; Thoat chuong trinh
    mov ah, 4ch
    int 21h                                    
    
    ; procedure ngat xuat chuoi
    printf proc
        mov ah, 9
        int 21h
        ret
    printf endp
    
    ; procedure xuat time
    xuat_time proc
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
    xuat_time endp
    
    ; procedure xuat ngay thang nam
    xuat_ngay proc
        cmp bl, 0
        je cn
        cmp bl, 1
        je t2
        cmp bl, 2
        je t3
        cmp bl, 3
        je t4
        cmp bl, 4
        je t5
        cmp bl, 5
        je t6
        cmp bl, 6
        je t7
        
        cn:
            lea dx,  chunhat
            call printf
            jmp exit

        t2:
            lea dx,  thu_hai
            call printf
            jmp exit

        t3:
            lea dx,  thu_ba
            call printf
            jmp exit

        t4:
            lea dx,  thu_tu
            call printf
            jmp exit

        t5:
            lea dx,  thu_nam
            call printf
            jmp exit

        t6:
            lea dx,  thu_sau
            call printf
            jmp exit

        t7:
            lea dx,  thu_bay
            call printf
            
            jmp exit
            
            
        exit:            
            ret
    xuat_ngay endp
end
