.model small
.stack 100h
.data
    msgi db 'Nhap chuoi ky tu: $'
    str db 100 dup(?)
    msgoth db 10, 13, 'Ket qua thuong -> hoa: $' 
    msgoht db 10, 13, 'Ket qua hoa -> thuong: $'
.code
main PROC
    ; chuyen dia chi data vao ds
    mov ax, @data
    mov ds, ax
    
    ; in thong bao nhap
    lea dx, msgi
    mov ah, 9
    int 21h
    
    ; nhap chuoi
    mov bx, 0; i
    
nhap:
    mov ah, 1
    int 21h
    cmp al, 13 ; kiem tra phim vua nhap la enter?
    je dung
    mov str[bx], al; str[i] = al
    inc bx; i++
    jmp nhap

dung:
    ; in thong bao in
    mov dx, offset msgoth
    mov ah, 9
    int 21h
    
    ; in chuoi
    mov cx, bx; so lan lap = so ky tu trong chuoi
    mov bx, 0; i
inchuoi:
    mov ah, 2
    mov dl, str[bx]
    cmp dl, 97
    jb xuat
    cmp dl, 122
    ja xuat
    sub dl, 32
xuat:
    inc bx; i++
    int 21h
    loop inchuoi
    
    ; in thong bao in
    mov dx, offset msgoht
    mov ah, 9
    int 21h
    
    ; in chuoi
    mov cx, bx; so lan lap = so ky tu trong chuoi
    mov bx, 0; i
inchuoiht:
    mov ah, 2
    mov dl, str[bx]
    cmp dl, 65
    jb xuatht
    cmp dl, 90
    ja xuatht
    add dl, 32
xuatht:
    inc bx; i++
    int 21h
    loop inchuoiht
    
    ; ket thuc chuong trinh
    mov ah, 4Ch
    int 21h
main ENDP
END main