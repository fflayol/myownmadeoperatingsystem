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
   call clearclr

   xor ax, ax ; make it zero
   mov ds, ax
   mov si,hello
   call printline
endk:   
   jmp endk

printline:

   push ebp
   mov	ebp, esp
   
   mov ax,0xb800
   mov es,ax

   xor ax, ax 
   mov ds, ax
   mov cx,si
   mov si, cursor
   lodsw
   mov bx,ax
   mov si,cx
loop:   
   lodsb
   or al,al
   jz end
   cmp al,13
   jne loop2
   add bx,160
   mov [cursor],bx
   jmp loop
loop2:   
   mov [es:bx],al
   inc bx
   mov ah,10
   mov [es:bx],ah
   inc bx
   mov [cursor],bx
   jmp loop
end:
   mov	esp, ebp
   pop	ebp
   ret   
        
clearclr:

   push ebp
   mov	ebp, esp
   push es
   
   mov ax,0xb800                
   mov es,ax
   xor eax,eax
   mov cx,1000
   rep stosd
   
   xor ax, ax ; make it zero
   mov ds, ax 
   mov [cursor],ax
     
   pop es
   mov	esp, ebp
   pop	ebp
   ret

cursor dw 10
color dw 1
msg    db 'Hello World 111', 13, 10, 0
hello  db 'Kernel started',0 
   times 510-($-$$) db 0
   db 0x55
   db 0xAA
