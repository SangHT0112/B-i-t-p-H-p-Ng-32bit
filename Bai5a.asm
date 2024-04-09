include irvine32.inc
include macros.inc
.386
.model flat, stdcall
.stack 4096
ExitProcess proto, dwExitCode:dword

.data
    x real4 ?
    n dword ?
    s real4 ?

.code
main proc
    xor eax, eax

    ; Nh?p gi� tr? c?a x v� n t? b�n ph�m
    call ReadFloat
    fstp x ; L?u gi� tr? c?a x v�o bi?n x
    call ReadInt
    mov n, eax ; L?u gi� tr? c?a n v�o bi?n n

    fld1 ; Load 1 l�n ng?n x?p

    mov ecx, 0 ; Kh?i t?o bi?n ??m
    while_loop:
        cmp ecx, n ; So s�nh bi?n ??m v?i n
        jge end_while ; N?u bi?n ??m l?n h?n ho?c b?ng n, k?t th�c v�ng l?p

        fmul x ; Nh�n gi� tr? tr�n ng?n x?p v?i x
        inc ecx ; T?ng bi?n ??m l�n 1
        jmp while_loop ; L?p l?i

    end_while:
    fstp s ; L?u k?t qu? v�o bi?n s

    ; In k?t qu? ra m�n h�nh
    invoke StdOut, addr s
    invoke ExitProcess, 0 ; K?t th�c ch??ng tr�nh
main endp
end main
