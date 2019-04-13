cursor macro y,x
    mov ah,02
    mov bh,00
    mov dl,x
    mov dh,y
    int 10h
endm

display macro string
    mov ah,09
    mov dx,offset string
    int 21h
endm



.model small

.stack 64
.data

oldVedio db ?
newVedio db 12h

msg1 db "press left button several times","$"
msg2 db "to find how many times you pressed this key press any key","$"
msg3 db "you pressed it","$"
msg4 db "now press any key to return to dos","$"

p_count db ?,?,"times$"

.code




main proc far
    
  mov ax,@data
  mov ds,ax
   
   mov ah,0fh
   int 10h
   mov oldVedio,al
   
   mov ax,0600h
   mov cx,0000h
   mov dx,184fh
   mov bh,07
   int 10h
   
   mov ah,00
   mov al,newVedio
   int 10h
   
   ; intialize mouse
   mov ax,00h
   int 33h
   
   mov ax,01
   int 33h
   
   cursor 2,1
   display msg1
   cursor 4,1
   display msg2
   
   mov ah,07 ; wait for key press
   int 21h
   
   mov ax,05h ;  new !! get mouse press count 
   mov bx,0          ; if bx ->0 left , bx->1 right
   int 33h
   
   mov ax,bx  ;bx has count 
   mov bl,10
   div bl
   
   or ax,3030h ; convert to ascii
   mov p_count,al
   mov p_count+1,ah
   cursor 10,2
   display msg3
   
   display p_count
   cursor 20,2
   display msg4
   
   mov ah,07      ; wait for key press
   int 21h
   
   mov ax,02
   int 33h
   
   mov ah,00
   mov al,oldVedio
   int 10h
   
   mov ah,4ch
   int 21h 
    
main endp

end main