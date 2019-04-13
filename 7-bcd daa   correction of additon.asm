; bcd adjustment for addition page 105

.model small

.data
 result db ?
.code



main proc far
    
  
  mov ax,@data
  mov ds,ax
  
mov al,17h
mov bl,28h



add al,bl
daa
mov result,al  
  

  
    
    
main endp
end main