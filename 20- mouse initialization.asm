.model small

.data

result dw 2 dup(0)

.code


main proc far
    
 mov ax,@data
 mov ds,ax
 
 ;code
 
 
 mov ax,0 ; mouse initialization
 int 33h
 
 cmp ax,0  ;check the existance of mouse
 je exit
 mov dx,bx
 
 exit:
 mov ah,4ch
 int 21h
     
main endp

end main