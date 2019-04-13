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


mov ah,00
mov al,07 ; CGA mode
 int 10h

 ; repeting letter d 200 times with black on white
mov ah,09 ; dsiplay char
mov bh,00 ; page 0
mov al,44h  ; asci for d
mov cx,200h ; repeat char 200 times 
mov bl,0f0h ; black on white  blinking
; white on black only --> 70h
int 10h
  
    
    
main endp
end main