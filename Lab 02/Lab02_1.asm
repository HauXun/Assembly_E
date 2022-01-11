.model small
.stack 100h
.data

.code
   ;mov ax, 7FFFh
   ;mov bx, 1
   ;add ax, bx
   ; CF = 0, SF = 1, ZF = 0, PF = 1, OF = 1
   
   ;mov al, 1
   ;mov bl, 00FFh
   ;sub al, bl
   ; CF = 1, SF = 0, ZF = 0, PF = 0, OF = 0
   
   ;mov al, 0
   ;dec al     
   ; CF = 0, SF = 1, ZF = 0, PF = 1, OF = 0
   
   ;mov al, 7Fh
   ;neg al     
   ; CF = 1, SF = 1, ZF = 0, PF = 1, OF = 0
   
   ;mov ax, 1ABCh
   ;mov bx, 712Ah
   ;xchg ax, bx     
   ; CF = 0, SF = 0, ZF = 0, PF = 0, OF = 0 
   
   ;mov al, 80h
   ;mov bl, 00FFh
   ;add al, bl     
   ; CF = 1, SF = 0, ZF = 0, PF = 0, OF = 1
   
   ;mov ax, 0
   ;mov bx, 8000h
   ;sub ax, bx     
   ; CF = 1, SF = 1, ZF = 0, PF = 1, OF = 1
   
   mov ax, 1  
   neg ax                                  
   ; CF = 1, SF = 1, ZF = 0, PF = 1, OF = 0 
   
   mov ah, 4ch
   int 21h
end