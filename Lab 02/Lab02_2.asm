.model small
.stack 100h
.data

.code
   ;mov ax, 512Ch
   ;mov bx, 4185h
   ;add ax, bx
   ; OF = 1
   
   ;mov ah, 00FEh
   ;mov al, 0012h
   ;mov bx, 1ACBh
   ;add ax, bx                              
   ; OF = 0
   
   ;mov ah, 00E1h
   ;mov al, 00E4h
   ;mov bh, 00DAh 
   ;mov bl, 00B3h
   ;add ax, bx                                  
   ; OF = 0
   
   ;mov ax, 7132h
   ;mov bx, 7000h
   ;add ax, bx                                  
   ; OF = 1
   
   mov ax, 6389h
   mov bx, 1176h
   add ax, bx                             
   ; OF = 1
   
   mov ah, 4ch
   int 21h
end