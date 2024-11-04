.model small
.stack 100h
.data
    s1 db "Nhap day ki tu: $"
    s2 db 10, 13, "Day sau khi chuyen het thanh chu hoa: $"
    a db 100 dup(?)
.code
    main proc
        mov ax, @data
        mov ds, ax
        
        mov ah, 9
        lea dx, s1
        int 21h
        
        mov bx, 0
        
        nhap:
        mov ah, 1
        int 21h
        
        cmp al, 13
        je in_s2
        
        mov a(bx), al
        inc bx
        jmp nhap:
        
        in_s2:
        
        mov ah, 9
        lea dx, s2
        int 21h
        
        mov cx, bx
        mov bx, 0
        
        lap:
        cmp a(bx), "a"
        jge chuyen
        inc bx
        
        kt_lap:
        loop lap
        
        mov cx, bx
        mov bx, 0
        
        jmp in_kq:
        
        chuyen:
        sub a(bx), 32
        inc bx
        jmp kt_lap
        
        in_kq:
        mov dl, a(bx)
        
        mov ah, 2
        int 21h
        
        inc bx
        loop in_kq
        
        mov ah, 4ch
        int 21h
        
    main endp
end main