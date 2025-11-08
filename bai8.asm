.model small
.stack 100h
.data
   list db 1,2,3,4,5,6,7,8
.code
    main proc
        mov ax, @data
        mov ds, ax
        
        mov cx, 7
        lea si, list
        
        mov dl, [si]
        inc si
        
        lap:
            mov al, [si]
            inc si
            cmp dl, al
            jge bypass
            mov dl, al
            bypass:
               loop lap
               
        add dl, '0'
        mov ah, 2
        int 21h 
        
                
        mov ah, 4ch
        int 21h
    main endp
end