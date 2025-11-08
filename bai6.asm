.model small
.stack 100
.data
   s1 db "Nhap chuoi: $"
   s2 db 10, 13, "Chuoi dao nguoc: $"
   str db 100 dup('$')
.code
    main proc
        mov ax, @data
        mov ds, ax
               
        ; in s1
        lea dx, s1
        mov ah, 9
        int 21h
        
        
        ; nhap chuoi
        lea dx, str
        mov ah, 10  
        int 21h
        
        
        ; in s2
        lea dx, s2
        mov ah, 9
        int 21h
        call daonguoc
        
        
        mov ah, 4ch
        int 21h
    main endp
    
    
    
    daonguoc proc
        lea si, str+2
        mov cl, [str+1]
        mov ch, 0
        lap1:     
           mov dl, [si]
           mov dh, 0
           push dx
           inc si
           loop lap1
           
        mov cl, [str+1]
        mov ch, 0
            
        lap2:
           pop dx
           mov al, dl
           mov ah, 2
           int 21h
           loop lap2       
            
        ret
    daonguoc endp
   
    
end

