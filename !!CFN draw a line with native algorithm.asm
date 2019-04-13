;reverse a list of numbers
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

cin_num macro 
    mov ah,01
    int 21h
endm    

clear macro 
    mov ax,0600h
    mov bh,07
    mov cx,0000
    mov dx,184fh
    int 10h
endm
        
draw macro x1,y1,x2,y2,color 
    local draw_vertical,draw_horizontal
     
     mov dx,y1 ; row
     mov cx,x1
     
     cmp cx,x2   
     je draw_vertical

      
      
     cmp dx,y2
     je draw_horizontal
         
         
     draw:
        ;set pixel
        mov ah,0ch
        mov al,color 
        int 10h
        
       sub cx,x2
       sub dx,y2
       
       mov diffy,dx
       mov diffx,cx
       mov cx,x1
       mov dx,y1
       
       l1:
        ;set pixel
        mov ah,0ch
        mov al,color 
        int 10h
        
        add cx,diffx
        add dx,diffy
       
       
       loop l1
     
     jnz draw
     
    draw_vertical:
    
        mov ah,0ch
        mov al,color 
        int 10h
        
        inc dx
        
    jnz draw_vertical
        
    draw_horizontal:
    
        mov ah,0ch
        mov al,color 
        int 10h
        
        inc cx
        
    jnz draw_horizontal    
        
endm    
    
.model small

.stack

.data

 p1_x db 5
 p1_y db 5
 diffx dw ?
 diffy dw ?

.code

main proc
    
     mov ax,@data
     mov ds,ax
     ;code
     
     clear ; clear screen
     
     ; set video mode
     
     mov ah,00
     mov al,13h
     int 10h
     
    draw 200,23,150,34,3 ; x1,y1,x2,y2,color   
main endp

end main