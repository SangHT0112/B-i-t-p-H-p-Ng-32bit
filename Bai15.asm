include irvine32.inc ; Bao g?m th? vi?n Irvine32 ?? s? d?ng c�c h�m nh?p xu?t

.data ; Ph?n khai b�o d? li?u
    n dword ? ; Khai b�o bi?n n ?? l?u s? nguy�n d??ng nh?p t? b�n ph�m
    reversed_number dword ? ; Khai b�o bi?n reversed_number ?? l?u s? ??o ng??c c?a s? nguy�n d??ng n

.code ; Ph?n m� l?nh
main proc ; B?t ??u qu� tr�nh th?c thi c?a ch??ng tr�nh
    xor eax, eax ; X�a thanh ghi eax

    ; Nh?p s? nguy�n d??ng n t? b�n ph�m
    call ReadInt ; G?i h�m ReadInt ?? nh?p s? nguy�n t? b�n ph�m
    mov n, eax ; Di chuy?n gi� tr? nh?p ???c v�o bi?n n

    mov eax, n ; Di chuy?n gi� tr? c?a n v�o thanh ghi eax
    mov reversed_number, 0 ; Kh?i t?o gi� tr? c?a reversed_number b?ng 0

    while_loop: ; Nh�n c?a v�ng l?p
        test eax, eax ; Ki?m tra xem gi� tr? c?a eax c� b?ng 0 kh�ng
        jz end_while ; N?u b?ng 0, tho�t kh?i v�ng l?p

        mov edx, 0 ; X�a thanh ghi edx ?? s? d?ng trong ph�p chia
        div dword ptr [digit] ; Chia eax cho 10, l?u k?t qu? v�o eax v� ph?n d? v�o edx
        imul reversed_number, 10 ; Nh�n reversed_number v?i 10 ?? d?ch sang tr�i m?t ch? s?
        add reversed_number, edx ; C?ng ch? s? d? v�o reversed_number

        jmp while_loop ; L?p l?i v�ng l?p

    end_while: ; Nh�n k?t th�c v�ng l?p

    ; In k?t qu? ra m�n h�nh
    invoke StdOut, addr reversed_number ; In ra s? ??o ng??c c?a s? nguy�n d??ng n
    invoke ExitProcess, 0 ; K?t th�c ch??ng tr�nh

digit dword 10 ; Bi?n gi�p chia s? nguy�n cho 10

main endp ; K?t th�c qu� tr�nh th?c thi c?a ch??ng tr�nh
end main ; K?t th�c ch??ng tr�nh
