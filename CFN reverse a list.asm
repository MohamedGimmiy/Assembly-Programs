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
    
    
    
.model small

.stack

.data

list db 12h,3h,44h,1h,32h
list2 db 5 dup (?)

num db ?,"$"



.code

main proc
    
     mov ax,@data
     mov ds,ax
    mov cx,5
     
    lea si,list+4
    lea di,list2
    
    l1:
    
    mov al,[si]
    mov [di],al
    
    inc di
    dec cx
    dec si
    jnz l1
     
    
    
main endp

end main

