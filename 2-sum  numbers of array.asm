
; this program sum two numbers and but thier sum into a result
.model small

.stack 64

.data

Array_Data db 1h,2h,3h,4h,5h

sum db ?


.code

   main  proc far

  mov ax,@data
  mov ds,ax

   ;code

   mov cx,5

   lea si, Array_Data

    ; loop
    myloop:

          add dl,[si]  ; add value bx pointer to  -----> to al

          inc si     ; increament our pointer
          dec cx     ; decrement cx
    jnz myloop

   mov sum,dl




  ;end our program
  mov ah,4ch
  int 21h



   main endp

   end main
