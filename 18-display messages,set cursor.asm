.model small

.data

outmesg1 db "my name","$"

outmesg2 db "is joe!","$"

outmesg3 db "what is","$"

outmesg4 db "your name?","$"
.code

display macro  n1
    mov ah,09
    mov dx,offset n1
    int 21h
endm

set_cursor macro y,x
    
    mov ah,02
    mov bh,00
    mov dl,x
    mov dh,y
    int 10h
endm
    
main proc far
    
 mov ax,@data
 mov ds,ax
 
 ;code
 set_cursor 2,4
 
 display outmesg1 ;output a message
 
 set_cursor 7,24
 
 display outmesg2 ;output a message  
 
 set_cursor 12,44
  
 display outmesg3 ;output a message
   
 set_cursor 19,64
     
 display outmesg4 ;output a message
     
main endp

end main