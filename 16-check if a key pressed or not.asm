.model small

.data

outmesg db "to stop the bil press any key","$"
.code

display macro  n1
    mov ah,09
    mov dx,offset n1
    int 21h
 endm
    
    
    
main proc far
    
 mov ax,@data
 mov ds,ax
 
 ;code
 
 display outmesg ;output a message
 
 myloop:     
 mov ah,02   ; sending to monitor a single char
 mov dl,07   ; sound bill
 int 21h
 
 mov ah,01   ; check if a key pressed r not zf =0 or zf=1
 int 16h
 
 jz myloop
 
 
 
 
    
    
    
    
    
main endp

end main