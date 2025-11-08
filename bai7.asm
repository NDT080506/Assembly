.model small
.stack 100h
.data
   str db 100 dup('$') 
.code
    main proc
        mov ax, @data
        mov ds, ax
               
        mov cx, 0
        start:
            inc cx
            mov ah, 1
            int 21h 
            
            mov ah, 0
            cmp al, '#'
            je space
            push ax
            jmp start
            
            
        space:   
            mov dl, 32
            mov ah, 2
            int 21h 
        
        
        end:         
                           
            pop dx
            mov ah, 2
            int 21h
            dec cx
            cmp cx, 1
            jne end
        
                       
               
        mov ah, 4ch
        int 21h
    main endp
end