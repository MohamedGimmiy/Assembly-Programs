.model small

.data

msg1 db "There a message for you from mr.Jones. To read it enter Y.",0ah,0dh,"$"

msg2 db 0ah,0dh,"Hi! I must leave town tomorrow, therefore i will not be able to see you","$"

msg3 db 0ah,0dh,"no more messages for you","$"

buffer db 14 ? 14 dup (0)

display macro  n1
    
    mov ah,09
    mov dx,offset n1
    int 21h
 
 endm

read_s macro  n2
    mov ax,offset n2
    mov ah,0ah
    int 21h
    
    mov cl,buffer+1 ; get count of letters
    or cl,30h       ; converting them to asci
    mov msg2+40,cl  ;attach result to msg2
    
endm

clear macro 
    mov ax,0600h
    mov cx,0000
    mov bh,07
    mov dx,184fh
    int 10h
endm

set_cursor macro  x,y
    
    mov ah,02
    mov bh,00
    mov dh,x
    mov dl,y
    int 10h
endm

 read_l macro 
    
    mov ah,01
    int 21h
    
    cmp al,'y'
    je next
    
    cmp al,'Y'
    je next
    
    jmp exit
    next:
    display msg2
    
    exit:
    
endm

.code



main proc far
    
  mov ax,@data
  mov ds,ax
  
  clear
  
  set_cursor 08,05
  
  display msg1 
  
  read_l
  
  mov ah,01
  int 21h
  
  display msg3 
    
main endp

end main