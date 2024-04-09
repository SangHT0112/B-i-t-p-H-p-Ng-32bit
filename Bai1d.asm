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

    xor eax, eax
    xor ecx, ecx
    mov ebx, 0 ; ??t gi� tr? ban ??u l� 0
    mov esi, 1 ; Bi?n ??m
    while_main:
        cmp esi, n
        jg endw_main
        mov edx, esi ; L?u gi� tr? c?a bi?n ??m v�o edx
        add edx, 1 ; T?ng gi� tr? c?a edx l�n 1 ?? th?c hi?n ph�p c?ng t? 1 ??n edx
        xor eax, eax ; ??t eax = 0 ?? t�nh t?ng t? 1 ??n edx
        mov ecx, 1 ; ??t ecx = 1 ?? b?t ??u t? 1
        while_inner:
            cmp ecx, edx ; So s�nh ecx v� edx
            jg endw_inner ; N?u ecx > edx th� k?t th�c v�ng l?p
            add eax, ecx ; C?ng ecx v�o eax ?? t�nh t?ng
            inc ecx ; T?ng gi� tr? c?a ecx l�n 1 ?? ti?p t?c v�ng l?p
            jmp while_inner
        endw_inner:
        add ebx, eax ; C?ng t?ng c?a t? 1 ??n edx v�o t?ng ch�nh
        inc esi ; T?ng bi?n ??m l�n 1 ?? x�t ti?p t?c chu?i
        jmp while_main
    endw_main:
        mov s, ebx
        invoke writedec, s
        call crlf
        invoke ExitProcess, 0
main endp
end main
