include irvine32.inc

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
    while_main:
        cmp ecx, n
        jg endw_main
        imul eax, ebx, 2
        inc eax
        add ebx, eax
        inc ecx
        jmp while_main
    endw_main:
        mov s, ebx
        invoke writedec, s
        call crlf
        invoke ExitProcess, 0
main endp
end main
