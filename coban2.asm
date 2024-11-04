.model small
.stack 100h
.data
.code 
    main proc 
        ;cong
        mov al, 9
        mov bl, 5
        add al, bl
        
        ;tru
        mov al, 9
        mov bl, 5
        sub al, bl  
        
        ;nhan
        mov al, 9
        mov bl, 5
        mul bl 
    main endp
end main