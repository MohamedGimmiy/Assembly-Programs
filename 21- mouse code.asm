.model small

.data

result dw 2 dup(0)

.code


main proc far
    
 mov ax,@data
 mov ds,ax
 
 ;code
 
 ; get current video mode
 mov ah,0fh
 int 10h
 mov bl,al ;save video mode in bl
 
 ; set VGA video mode
 mov ah,0
 mov al,10h
 int 10h
 
 ;initialize mouse
 mov ax,0
 int 33h
 
 ;make mouse visible
 mov ax,1
 int 33h
 
 ;waiting for pressing and key
 mov ah,01
 int 21h
 
 ;making mouse invisible
 mov ax,2
 int 33h
 
 ;restore video mode
 mov ah,0
 mov al,bl
 int 10h
 
     
main endp

end main