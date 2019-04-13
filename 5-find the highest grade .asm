; find the highest grade 

.model small

.data

 grades db 69,87,96,45,75
 
.code



main proc far
    
  
  mov ax,@data
  mov ds,ax
  
  
  ; code
  
  mov cx,4
  
  lea si,grades
  mov bh,[si]
  inc si
  
  myloop:
    
  
   cmp bh,[si]
    jl assign
          
     inc si
    dec cx
    
    
  jnz myloop
    
    exit:
    mov ah,4ch
    int 21h
    
  assign:
    mov bh,[si]
    inc si
    dec cx
    jmp myloop
  
    
    
main endp
end main