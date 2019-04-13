.model small

.data

result dw 2 dup(0)

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

multiply macro val1,val2,resul
    mov bx,val1   ; first value 
    mov cx,val2-1 ; counter
    
    back:
        add bx,val1
        adc dx,00
    loop back
    
    mov resul,bx
    endm
main proc far
    
 mov ax,@data
 mov ds,ax
 
 ;code
 multiply 2,5,result
     
main endp

end main