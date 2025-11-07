.model small
.stack 100
.data
    s1 db "Nhap 1 ky tu: $"
    s2 db 13, 10, "Xuat ra man hinh: $"
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