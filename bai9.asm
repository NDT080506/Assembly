.model small
.stack 100h
.data
 
.code
    main proc
        mov ax, @data
        mov ds, ax
        
        mov ah, 1
        int 21h
        sub al, '0'
        mov ah, 0
        mov bx, ax
  
        mov dl, 10
        mov ah, 2
        int 21h
        mov dl, 13
        mov ah, 2
        int 21h
        
        
        mov ax, 1
        cmp bx, 0
        je skip      
        
        lap:
            mul bx
            sub bx, 1
            jnz lap
                   
        skip:
            mov bx, 10
            mov cx, 0  
                 
        convert_num:
            mov dx, 0
            div bx
            push dx
            inc cx
            cmp ax, 0
            jne convert_num
            
        
        print_num:
            pop dx
            add dx, '0' 
            mov ah, 2
            int 21h
            dec cx
            jnz print_num
         
        
        mov ah, 4ch
        int 21h
    main endp
end