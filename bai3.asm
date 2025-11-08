.model small
.stack 100h
.data
    s1 db "Nhap mot ki tu thuong: $"
    s2 db 13, 10, "Ki tu in hoa: $"
    output db ?
    
.code
    main proc
        mov ax, @data
        mov ds, ax
        
        lea dx, s1
        mov ah, 9
        int 21h
        
        
        mov ah, 1
        int 21h
        mov output, al
        sub output, 20h
        
        lea dx, s2
        mov ah, 9
        int 21h
        
        
        mov dl, output
        mov ah, 2
        int 21h
               
        
        mov ah, 4ch
        int 21h
        
    main endp
end