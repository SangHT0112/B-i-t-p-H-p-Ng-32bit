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

    xor eax, eax
    xor ecx, ecx
    mov ebx, 0 ; ??t giá tr? ban ??u là 0
    mov esi, 1 ; Bi?n ??m
    while_main:
        cmp esi, n
        jg endw_main
        mov edx, esi ; L?u giá tr? c?a bi?n ??m vào edx
        add edx, 1 ; T?ng giá tr? c?a edx lên 1 ?? th?c hi?n phép c?ng t? 1 ??n edx
        xor eax, eax ; ??t eax = 0 ?? tính t?ng t? 1 ??n edx
        mov ecx, 1 ; ??t ecx = 1 ?? b?t ??u t? 1
        while_inner:
            cmp ecx, edx ; So sánh ecx và edx
            jg endw_inner ; N?u ecx > edx thì k?t thúc vòng l?p
            add eax, ecx ; C?ng ecx vào eax ?? tính t?ng
            inc ecx ; T?ng giá tr? c?a ecx lên 1 ?? ti?p t?c vòng l?p
            jmp while_inner
        endw_inner:
        add ebx, eax ; C?ng t?ng c?a t? 1 ??n edx vào t?ng chính
        inc esi ; T?ng bi?n ??m lên 1 ?? xét ti?p t?c chu?i
        jmp while_main
    endw_main:
        mov s, ebx
        invoke writedec, s
        call crlf
        invoke ExitProcess, 0
main endp
end main
