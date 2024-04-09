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

    ; Nh?p gi� tr? c?a n t? b�n ph�m
    call ReadInt
    mov n, eax

    mov ebx, 1      ; Kh?i t?o t?ng l� 1
    mov ecx, 1      ; Kh?i t?o ch? s? v�ng l?p l� 1
    mov edx, 1      ; Kh?i t?o bi?n ??m giai th?a l� 1

    while_outer_loop:
        cmp ecx, n      ; So s�nh ch? s? v?i n
        jg end_outer_loop       ; N?u ch? s? v??t qu� n, k?t th�c v�ng l?p

        ; T�nh giai th?a
        mov eax, 1      ; ??t eax = 1 ?? t�nh giai th?a
        mov esi, 1      ; Kh?i t?o bi?n ??m cho v�ng l?p t�nh giai th?a

        while_factorial_loop:
            cmp esi, edx                ; So s�nh bi?n ??m v?i gi� tr? c?a edx
            jg end_factorial_loop       ; N?u bi?n ??m v??t qu� gi� tr? c?a edx, k?t th�c v�ng l?p
            imul eax, eax, esi          ; T�nh giai th?a v� l?u v�o eax
            inc esi ; T?ng bi?n ??m l�n 1
            jmp while_factorial_loop        ; L?p l?i

        end_factorial_loop:
        add ebx, eax        ; C?ng giai th?a v�o t?ng
        inc ecx         ; T?ng ch? s? l�n 1
        inc edx         ; T?ng bi?n ??m giai th?a l�n 1
        jmp while_outer_loop ; L?p l?i

    end_outer_loop:
        mov s, ebx ; L?u k?t qu? v�o bi?n s
        invoke writedec, s      ; In k?t qu? ra m�n h�nh
        call crlf ; Xu?ng d�ng
        invoke ExitProcess, 0       ; K?t th�c ch??ng tr�nh
main endp
end main

;Trong ?o?n m� tr�n, ch�ng ta s? d?ng hai v�ng l?p l?ng nhau.
;V�ng l?p b�n ngo�i ???c s? d?ng ?? duy?t qua t?ng s? t? 1 ??n n. 
;Trong khi ?�, v�ng l?p b�n trong ???c s? d?ng ?? 
;t�nh giai th?a c?a c�c s? t? 1 ??n gi� tr? hi?n t?i c?a bi?n ??m edx.
;Sau ?�, ch�ng ta c?ng giai th?a n�y v�o t?ng v� t?ng bi?n ??m l�n.
;Cu?i c�ng, ch�ng ta in ra k?t qu? nh? th�ng th??ng.