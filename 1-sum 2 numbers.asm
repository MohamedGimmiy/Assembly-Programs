
; this program sum two numbers and but thier sum into a result
.model small
 
.stack 64

.data

num1 db 12h
num2 db 22h

sum db ?


.code
   
   main  proc far
    
  mov ax,@data
  mov ds,ax
  
  mov bl,num1
  mov bh,num2
  add bh,bl
  ; add two numbers
  mov sum,bh
     
  ;end our program
  mov ah,4ch
  int 21h
   
    

   main endp
   
   end main
