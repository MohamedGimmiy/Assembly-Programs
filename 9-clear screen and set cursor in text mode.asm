; Text Mode monitor is divide into 25 rows 80 cols

.model small

.data
dat db 97h
count db ?
.code



main proc far
    
mov ax,@data
mov ds,ax

; code 


; clear screen
  mov ax,0600h
  mov bh,07
  mov cx,0000
  mov dx,184fh
  int 10h
  
  ; set cursor to position row =15 (0fh) and col=25 (19h)
  
  mov ah,02 
  mov bh,00
  mov dh,15  ; row
  mov dl,25  ; col
  int 10h
  
  ; set cursor in the center of screen
  
  mov ah,02
  mov bh,00
  mov dl,39
  mov dh,12
  int 10h  

  
    
    
main endp
end main