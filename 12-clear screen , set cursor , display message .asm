; clear screen , set cursor , display string

.model small

.data
dd db "Hello assembly language$"
.code
main proc 
    
mov ax,@data
mov ds,ax

; code 

;clear screen 

mov ax,0600h
mov bh,07
mov cx,0000
mov dx,184fh


;set cursor

mov ah,02
mov bh,00
mov dl,5
mov dh,5
int 10h

;display a message

mov ah,09
mov dx,offset dd
int 21h

  
main endp
end main