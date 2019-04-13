; transfer 6 bytes from offset 10 to 28
.model small
 
.stack 64

.data

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

org 10h ;data location

Data_loc db 1h ,22h,13h,52h,33h

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

org 28h ;data destination to be copied to.

copied_data 5 dup (?)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


.code
   
   main  proc far
    
  mov ax,@data
  mov ds,ax
  
     ;code
     
     
  mov si,offset Data_loc  ; pointer to location
  
  mov di,offset copied_data ; pointer to destination
  
  mov cx,5
  
  myloop:
        
        mov al,[si]
        
        mov [di],al
        
        
       dec cx
       inc si
       inc di
  
  
  
    jnz myloop
     
  ;end our program
  mov ah,4ch
  int 21h
   
    

   main endp
   
   end main