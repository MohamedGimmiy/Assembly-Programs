cursor macro row,col
    mov ah,02
    mov bh,00
    mov dh,row
    mov dl,col
    int 10h
endm

display macro string
    mov ah,09
    mov dx,offset string
    int 21h
endm

fill macro row_start,col_start,row_end,col_end,color  ; very important 
        local start,again
        mov dx,row_start
        
    start:
        mov cx,col_start
    again:
        mov ah,0ch ;set pixel
        mov al,color ; set color
        int 10h
        inc cx
        
        cmp cx,col_end
        jne again
        inc dx
        cmp dx,row_end
    jne start
endm 

.model small
.stack 64h
.data

msg1 db "an ex: of how to use int 33h for mouse","$"
msg2 db "it works !","$"
msg3 db "click in the box to see what happens !","$"
msg4 db "no,No,NO,No I said in the box","$"
msg5 db "NOW Press Any key to get back to dos","$"

oldVideo db ?

newVedio db 12h

.code

main proc 
    mov ax,@data
    mov ds,ax
    
    mov ah,0fh
    int 10h
    mov oldVideo,al
    
    ;clear screen
    
    mov ax,0600h
    mov bh,07
    mov dx,184fh
    mov cx,0000h
    int 10h
    
    mov ah,00h
    mov al,newVedio
    int 10h
    
    cursor 0,0
    ;draw a red box
    fill 150,250,250,350,4
    
    cursor 1,1
    display msg1
    
    cursor 5,22
    display msg3
    
    mov ax,00h
    int 33h
    
    mov ax,01h ; make mouse visible
    int 33h
    
    back:
        mov ax,03h ;check for mouse button press
        int 33h
        cmp bx,0001h ; check if the left is pressd
        jne back
        
        cmp cx,250  ;check for the left corner of box
        jb not_inside
        cmp cx,350  ;check for the left corner of box
        ja not_inside
        cmp dx,150  ; check if below the top
        jb not_inside
        cmp dx,250
        ja not_inside
        
        cursor 18,18 ; set cursor to display message
        display msg2
        
        jmp exit
        
   not_inside:
            cursor 22,18
            display msg4
   exit:
        mov ax,02
        int 33h
        
        cursor 22,18
        display msg5
        
        mov ah,07
        int 21h
        
        mov ah,00
        mov al,oldVideo
        int 10h
        
        mov ah,4ch
        int 21h    
        
main endp
end main