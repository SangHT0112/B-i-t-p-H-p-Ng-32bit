include irvine32.inc
include macros.inc
.386
.model flat, stdcall
.stack 4096
ExitProcess proto, dwExitCode:dword

.data
    n dword ?
    s dword ?

.code
main proc
    xor eax, eax

    ; Nh?p giá tr? c?a n t? bàn phím
    call ReadInt
    mov n, eax

    mov ebx, 1      ; Kh?i t?o t?ng là 1
    mov ecx, 1      ; Kh?i t?o ch? s? vòng l?p là 1
    mov edx, 1      ; Kh?i t?o bi?n ??m giai th?a là 1

    while_outer_loop:
        cmp ecx, n      ; So sánh ch? s? v?i n
        jg end_outer_loop       ; N?u ch? s? v??t quá n, k?t thúc vòng l?p

        ; Tính giai th?a
        mov eax, 1      ; ??t eax = 1 ?? tính giai th?a
        mov esi, 1      ; Kh?i t?o bi?n ??m cho vòng l?p tính giai th?a

        while_factorial_loop:
            cmp esi, edx                ; So sánh bi?n ??m v?i giá tr? c?a edx
            jg end_factorial_loop       ; N?u bi?n ??m v??t quá giá tr? c?a edx, k?t thúc vòng l?p
            imul eax, eax, esi          ; Tính giai th?a và l?u vào eax
            inc esi ; T?ng bi?n ??m lên 1
            jmp while_factorial_loop        ; L?p l?i

        end_factorial_loop:
        add ebx, eax        ; C?ng giai th?a vào t?ng
        inc ecx         ; T?ng ch? s? lên 1
        inc edx         ; T?ng bi?n ??m giai th?a lên 1
        jmp while_outer_loop ; L?p l?i

    end_outer_loop:
        mov s, ebx ; L?u k?t qu? vào bi?n s
        invoke writedec, s      ; In k?t qu? ra màn hình
        call crlf ; Xu?ng dòng
        invoke ExitProcess, 0       ; K?t thúc ch??ng trình
main endp
end main

;Trong ?o?n mã trên, chúng ta s? d?ng hai vòng l?p l?ng nhau.
;Vòng l?p bên ngoài ???c s? d?ng ?? duy?t qua t?ng s? t? 1 ??n n. 
;Trong khi ?ó, vòng l?p bên trong ???c s? d?ng ?? 
;tính giai th?a c?a các s? t? 1 ??n giá tr? hi?n t?i c?a bi?n ??m edx.
;Sau ?ó, chúng ta c?ng giai th?a này vào t?ng và t?ng bi?n ??m lên.
;Cu?i cùng, chúng ta in ra k?t qu? nh? thông th??ng.