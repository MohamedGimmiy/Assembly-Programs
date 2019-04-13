; Text Mode monitor is divide into 25 rows 80 cols

.model small

.data

.code
main proc 
    
mov ax,@data
mov ds,ax

; code 

;clear screen 

mov ax,0600h
mov bh,07 ;normal attr
mov cx,0000
mov dx,184fh
int 10h


; set mode CGA Graphics Mode
mov ah,00
mov al,10h
int 10h

;draw horizontal line from (100,50) ---> (200,50)



mov cx,100
mov dx,50

draw:

mov ah,0ch ;set pixel  
mov al,01  ; pixel white
int 10h

inc cx
cmp cx,200
jne draw    
main endp
end main