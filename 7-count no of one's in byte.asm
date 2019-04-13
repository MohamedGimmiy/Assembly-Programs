; count number of one's in a byte 105

.model small

.data
dat db 97h
count db ?
.code



main proc far
    
mov ax,@data
mov ds,ax

sub bl,bl

mov dl,8

mov al,dat

again:

rol al,1
jnc nex
inc bl

nex :
dec dl

jnz again

mov count ,bl
  
  
mov ah,4ch
int 21h

  
    
    
main endp
end main