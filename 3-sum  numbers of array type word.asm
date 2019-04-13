
; this program sum two numbers and but thier sum into a result
.model small
 
.stack 64

.data

Array_Data dw 234dh,1de6h,3bc7h,566ah

sum dw ?


.code
   
   main  proc far
    
  mov ax,@data
  mov ds,ax
  
   ;code
    mov cx,4
    
    lea di,Array_Data
    
    loop:
        
        add dx,[di]
        dec cx
        add si,2
    
    
    
    jnz loop
    
     mov sum,dx
   
   
   
   
     
  ;end our program
  mov ah,4ch
  int 21h
   
    

   main endp
   
   end main