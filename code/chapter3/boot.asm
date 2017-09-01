[ORG 0x7c00]
        
   
   xor ax, ax ; make it zero
   mov ds, ax
   mov si, msg
ch_loop:
   lodsb
   or al, al  ; zero=end of string
   jz  start    ; get out
   mov ah, 0x0E
   int 0x10
   jmp ch_loop
 
start:

   mov si,hello
   call printline
   jmp start

printline:
   mov ax,0xb800
   mov es,ax
   mov si, cursor
   lodsw
   mov bx,ax
   ;;mov bx,0
loop:   
   lodsb
   or al,al
   jz end
   mov [es:bx],al
   inc bx
   inc bx
   mov [cursor],bx
   jmp loop
end:
;call clearclr
   ret
        
clearclr:

   push ebp
   mov	ebp, esp
   push es
   
   mov ax,0xb800                
   mov es,ax
   mov eax,0x000F000
   mov di,0x0
   mov cx,2000
   rep stosd
   
   pop es
   mov	esp, ebp
   pop	ebp
   ret
cursor dw 0
msg    db 'Hello World', 13, 10, 0
hello  db 'Kerner started',0 
   times 510-($-$$) db 0
   db 0x55
   db 0xAA
