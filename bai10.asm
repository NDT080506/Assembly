.model small
.stack 100h
.data
    str db 5 dup('?')
    tb db 10, 13, "so nhi phan cua he 10 la: $"
.code
    main proc
        mov ax, @data
        mov ds, ax
        
        lea dx, str
        mov ah, 10
        int 21h
        
        mov cl, [str+1]
        lea si, str+2
        mov ax, 0
        mov bx, 10
        
        thapphan:
            mov dx, 0
            mul bx
            mov dl, [si]
            sub dl, '0'
            add ax, dx
            inc si
            dec cl
            jnz thapphan
            
        mov bl, 2
        mov cl, 0
        nhiphan:     
            inc cl
            mov ah, 0
            div bl
            push ax
            cmp al, 0
            jne nhiphan
            
        
        
        lea dx, tb
        mov ah, 9
        int 21h
        
        
        
        print_num:
            pop dx
            mov dl, dh
            add dl, '0'
            mov ah, 2
            int 21h
            dec cl
            jnz print_num
        
        
        
            
        mov ah, 4ch
        int 21h
        
    main endp
end