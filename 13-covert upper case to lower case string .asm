;display string in lower case 


.model small

.data

n1 db 'enter the string',0dh,0ah,'$'
n2 db 'the lower string is',0dh,0ah,'$'

buffer db 80
        db 00
        db 80 dup(0)
.code

main proc far 

mov ax,@data
mov ds,ax

mov dx,offset n1
mov ah,09
int 21h


mov ah,0ah
mov dx,offset buffer
int 21h


mov ah,09
mov dx,offset n2
int 21h

mov ch,00h

mov cl,buffer+1 ; cl has the count of char entered
mov bx,offset buffer+2  ;point to the input string

mov di,00h
up:
mov dl,[bx+di] 
 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 
cmp dl,96  ; if letter is < a
jnc next    

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

add dl,20h ; to convert upper letters to lower

next:
mov ah,02h
int 21h
inc di
dec cx
jnz up

mov ah,4ch
int 21h

main endp
end main

