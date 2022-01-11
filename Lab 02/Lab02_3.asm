.model small
.stack 100h
.data

.code
   ;mov ax, 2143h
   ;mov bx, 1986h
   ;sub ax, bx
   ; OF = 0
   
   ;mov ax, 81FEh
   ;mov bx, 1986h
   ;sub ax, bx
   ; OF = 1
   
   ;mov ax, 19BCh
   ;mov bx, 81FEh
   ;sub ax, bx
   ; OF = 1 
   
   ;mov ax, 0002h
   ;mov bh, 00FEh
   ;mov bl, 000Fh
   ;sub ax, bx
   ; OF = 0
   
   mov ax, 8BCDh
   mov bx, 71ABh
   sub ax, bx
   ; OF = 1
                   
   mov ah, 4ch
   int 21h
end