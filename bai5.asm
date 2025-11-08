.model small
.stack 100h
.data
    s1 db 'Nhap mot chuoi: $'
    s2 db 10, 13, 'Chuoi thuong: $'
    s3 db 10, 13, 'Chuoi in hoa: $'
    output db 100 dup('$')
    
.code
    main proc
        mov ax, @data
        mov ds, ax
             
             
        ; in s1
        mov ah, 9
        lea dx, s1
        int 21h
            
            
        ; nhap chuoi
        mov ah, 10
        lea dx, output
        int 21h
        
        
        
        
       
        ; in s2
        mov ah, 9
        lea dx, s2
        int 21h
        call inthuong
        
            
            
        ; in s3
        mov ah, 9
        lea dx, s3
        int 21h
        call inhoa
        
            
            
        ; ket thuc chuong trinh
        mov ah, 4ch
        int 21h
        
    main endp
    
    ; chuong trinh con
    inhoa proc
       lea si, output+2
       lap1:
            mov dl, [si]
            cmp dl, 'a'
            jl ln1
            cmp dl, 'z'
            jg ln1
            sub dl, 32
        ln1:
            mov ah, 2
            int 21h
            inc si
            cmp [si], '$'
            jne lap1
       ret
    inhoa endp
                 
                 
    inthuong proc
       lea si, output+2
       lap2:
            mov dl, [si]
            cmp dl, 'A'
            jl ln2
            cmp dl, 'Z'
            jg ln2
            add dl, 32
        ln2:
            mov ah, 2
            int 21h
            inc si
            cmp [si], '$'
            jne lap2
       ret
    inthuong endp     
       
    
end