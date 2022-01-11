.model small
.stack 100h
.data
    tb1 DB 10,13, 'Nhap vao 1 so thap phan: $'
    tb2 DB 10,13, 'So thap phan vua nhap la: $'
       
.code
    ; load du lieu data vao ds thong qua ax
    mov ax, @DATA
    mov ds, ax    
    
    load:
        ; xuat thong bao nhap
        mov ah, 9
        lea dx, tb1
        int 21h
        call nhap
        
        ; nhap loi => reset nhap    
        cmp dx, 0
        je load
        
        ; xuat thong bao ket qua nhap    
        mov ah, 9
        lea dx, tb2
        int 21h
        
        mov ax, bx
        call xuat        
        
        ; tra quyen dieu khien lai cho he thong        
        mov ah, 4ch
        int 21h
    
    nhap proc
        
        ; reset thanh ghi da dung BX
        xor bx, bx
        
        input:
            ; nhap vao 1 kt tu va luu vao trong al
            mov ah, 1
            int 21h
            
            ; kiem tra nut enter de ket thuc viec nhap
            cmp al, 0Dh
            je break
            
            ; xu ly ngoai le nhap sai
            cmp al, '0'
            jb err
            cmp al, '9'
            ja err
            
            ; xu dung phep toan thao tac tren bit 'AND'
            ; de dua gia tri chuan ve thanh ghi al
            and al, 0Fh
            ; dua gia tri thanh ghi al vao cl
            ; cl o day nhu la bien tam
            mov cl, al
            ; xor de lay ra gia thuc
            xor ch, ch
            
            ; dua gia tri truoc do cua bx vao ax
            mov ax, bx
            ; gan he so nhan de day cac gia tri sau vao
            mov si, 10
            ; tien hanh nhan voi al va luu vao do
            mul si
            ; gan nguoc tro lai
            mov bx, ax
            ; tien hanh cong don de co gia tri tiep theo
            add bx, cx
            
            jmp input
        
        ; nhan ngoai le
        err:
            ; reset cac thanh ghi va nhay den exit de return
            xor bx, bx
            mov dx, 0
            jmp exit
        
        break:
            ; gan dx = 1 de tranh nhap lai
            mov dx, 1
        
        exit:
            ret
        
    nhap endp

    xuat proc
        ; ax luc nay mang dong gia tri bx
        ; gan bx = 10 va day se la he so chia
        mov bx, 10
        ; reset cx
        xor cx, cx
        
        push_stack:
            ; reset dx
            xor dx, dx
            ; chia bx vs ax he so du dc luu trong dx
            div bx
            ; push tuan tu vao stack
            push dx
            ; tang he so dem
            inc cx
            
            ; chia cho den khi ax con` cai' nit.
            cmp ax, 0
            ja push_stack
            
        print:
            ; pop lan luot tung gia tri trong stack ra
            pop dx
            ; quy chieu 30h
            or dx, 30h
            ; xuat ra
            mov ah, 2
            int 21h 
            
        loop print
        ret
        
    xuat endp
end
