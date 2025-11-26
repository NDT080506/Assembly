.model small
.stack 100h
.data
    str db 5 dup('?')
    tb db 10, 13, "so thap luc phan cua he 10 la: $"
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
            
        mov bl, 16
        mov cl, 0
        thaplucphan:     
            inc cl
            mov ah, 0
            div bl
            push ax
            cmp al, 0
            jne thaplucphan
            
        
        
        lea dx, tb
        mov ah, 9
        int 21h
        
        
        
        print_num:
            pop ax            
            mov dl, ah      
            cmp dl, 10
            jb print_digit
        
            sub dl, 10        
            add dl, 'A'       
            jmp do_print
        
        print_digit:
            add dl, '0'       
        
        do_print:
            mov ah, 2
            int 21h
        
            dec cl
            jnz print_num

            
        mov ah, 4ch
        int 21h
        
    main endp
end
