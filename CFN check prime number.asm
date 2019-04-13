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

msg2 db "number is prime","$"
msg3 db "number is not prime","$"

num db 6h

.code

main proc
    
     mov ax,@data
     mov ds,ax
     

     
    cursor 6,5
    mov al,num
    
    mov bl,2h
    mov dx,0000h ; to avoid divide overflow error
    mov ah,00h   ; to avoid divide overflow error
    
    ;loop check if it is prime or not
    l1:
    div bl
    cmp ah,00h
    jne next
    inc bh    ; if the number is divisable by bl val
    
    next: cmp bh,02h
    je false
    inc bl
    mov ax,0000h
    mov dx,0000h
    mov al,num
    cmp bl,num
    jne l1
    
    true:
        display msg2
        jmp exit
        
    false:
        display msg3
    
    
    
    exit:
        mov ah,4ch
        int 21h
     
    
    
    
main endp

convert proc
    
    
     
    
    
    
convert endp

end main

