.model small
.stack 100h
.data
    str1 db 10, 13, 'Hello, world !$'
    str2 db 10, 13, 'solor, system !$'
    str3 db 10, 13, 'Hello, universe !$'

.code
    ; Load data vao DS thong qua AX
    mov ax, @data
    mov ds, ax
    
    ; Xuat chuoi 1
    mov ah, 9
    lea dx, str1
    int 21h
    
    ; Xuat chuoi 2
    mov ah, 9
    lea dx, str2
    int 21h
    
    ; Xuat chuoi 3
    mov ah, 9
    lea dx, str3
    int 21h
    
    ; Tra quyen dieu khien cho he thong
    mov ah, 4ch
    int 21h
end