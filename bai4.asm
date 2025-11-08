.model small
.stack 100h
.data
    s1 db 'Nhap mot chuoi: $'
    s2 db 10, 13, 'Chuoi duoc nhap vao: $'
    output db 100 dup('$')
    
.code
    main proc
        mov ax, @data
        mov ds, ax
        
        
        mov ah, 9
        lea dx, s1
        int 21h
        
        
        mov ah, 10
        lea dx, output
        int 21h
        
        
        mov ah, 9
        lea dx, s2
        int 21h
        
        mov ah, 9
        lea dx, output+2
        int 21h
        
        
        mov ah, 4ch
        int 21h
        
    main endp
end