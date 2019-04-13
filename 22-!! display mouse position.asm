cursor macro y,x
    mov ah,02
    mov dl,x
    mov dh,y
    int 10h
endm

display macro n1
    mov ah,09
    mov dx,word ptr n1
    int 21h
endm

.model small

.data

oldVedio db ?

pos_ho db ?,?,'and$'
pos_ve db ?,?,'$'

result dw 2 dup(0)

.code


main proc far
    
 mov ax,@data
 mov ds,ax
 
 ;code
    mov ax,0600h
    mov cx,0000h
    mov bh,07
    mov dx,184fh
    int 10h
    
    
    mov ah,0fh
    int 10h
    
    mov oldVedio,al
    
    mov ah,00
    mov al,0eh
    int 10h
    
    mov ax,00
    int 33h
    
    mov ax,01 ;show mouse pos
    int 33h
again:
    mov ax,03 ; get mouse position
    int 33h
    
    mov ax,cx
    
     call convert
    
    mov pos_ho,al
    mov pos_ho+1,ah
    
    mov ax,dx
    
    call convert
    
    mov pos_ve,al
    mov pos_ve+1,ah
    

    
    cursor 5,2 
    
    display pos_ho
    
    display pos_ve
    
    mov ah,01
    int 16h
    jz again
    
    mov ah,02
    int 33h
    
    mov ah,0
    mov al,oldVedio
    int 10h
    
    mov ah,4ch
    int 21h
     
main endp

convert proc   
    shr ax,1 ; divide by 8 to convert to asci
	shr ax,1
	shr ax,1
    sub ah,ah
    mov bl,10
    div bl
    or ax,3030h  
    ret
convert endp
end main