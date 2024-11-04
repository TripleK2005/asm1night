.model small
.stack 100h
.data   
    sl db 0
.code
    main proc
        mov ax, @data
        mov ds, ax
        
        mov ah, 1
        int 21h
        mov sl, al
        
        mov ah, 2
        mov dl, sl
        int 21h
    main endp
end main