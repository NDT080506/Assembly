.model small
.stack 100h
.data
    str db 100 dup('$')
.code
    main proc
        mov ax, @data
        mov ds, ax
        
        lea dx, str
        mov ah, 10
        int 21h
                    
        mov dl, 10
        mov ah, 2
        int 21h
        mov dl, 13
        mov ah, 2
        int 21h 
        
             
        mov al, [str+1]
        mov ah, 0
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