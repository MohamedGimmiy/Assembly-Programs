.model small

.data

msg1 db "what is your last name?",0ah,0dh,"$"

msg2 db 0ah,0dh,"number of letters of your last name is ","$"

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

.code



main proc far
    
  mov ax,@data
  mov ds,ax
  
  display msg1 
  
  read_s buffer
  
  display msg2
  
   mov ah,02h
  int 21h
    
main endp

end main