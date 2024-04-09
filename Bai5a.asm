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

    ; Nh?p giá tr? c?a x và n t? bàn phím
    call ReadFloat
    fstp x ; L?u giá tr? c?a x vào bi?n x
    call ReadInt
    mov n, eax ; L?u giá tr? c?a n vào bi?n n

    fld1 ; Load 1 lên ng?n x?p

    mov ecx, 0 ; Kh?i t?o bi?n ??m
    while_loop:
        cmp ecx, n ; So sánh bi?n ??m v?i n
        jge end_while ; N?u bi?n ??m l?n h?n ho?c b?ng n, k?t thúc vòng l?p

        fmul x ; Nhân giá tr? trên ng?n x?p v?i x
        inc ecx ; T?ng bi?n ??m lên 1
        jmp while_loop ; L?p l?i

    end_while:
    fstp s ; L?u k?t qu? vào bi?n s

    ; In k?t qu? ra màn hình
    invoke StdOut, addr s
    invoke ExitProcess, 0 ; K?t thúc ch??ng trình
main endp
end main
