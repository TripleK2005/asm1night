w.model small
.stack 100h
.data    
     sl db "SonLu$"
.code
    main proc
        ;nhap vao 1 ki tu tu ban phim
        mov ah, 1
        int 21h                     
        ;in ra 1 ki tu
        mov ah, 2
        mov dl, 35h
        int 21h   
        ;in ra 1 xau
            ;b1 khai bao len data 
        mov ax, @data
        mov ds, ax
        mov ah, 9  
        lea dx, sl 
        int 21h   
        ;dung chuong trinh
        mov ah, 4ch
        int 21h
    main endp
end main