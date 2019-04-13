; convert asci to unpacked then packed bcd page 104

.model small

.data
 
 value1 db '47'
 result db ? 
 
.code



main proc far
    
  
  mov ax,@data
  mov ds,ax
  
   mov ax, word ptr value1 
   
   
   
   ;convert asci to unpacked bcd first
   
   and ax,0f0fh
   
   ;convert unpacked to packed bcd
   xchg ah,al
   
   mov cl,4
   
   shl ah,cl
   or al,ah
   mov result,al   
  ; code
  

  
    
    
main endp
end main