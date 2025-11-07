.model small
.stack 100h
.data
    ChaoTay db "Hello!$"
    Cach db 10, 13, "$"      
    ChaoTa db "Chao ban!$"
.code
    main proc
        mov ax, @data
        mov ds, ax
        
        mov ah, 9
        lea dx, ChaoTay
        int 21h
        
        mov ah, 9
        lea dx, Cach
        int 21h
        
        mov ah, 9
        lea dx, ChaoTa
        int 21h
        
        mov ah, 4ch
        int 21h
    main endp
end