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
    while_main:
        cmp ecx, n
        jg endw_main
        shl ecx, 1  ; Nh�n cho 2
        add ebx, ecx
        inc ecx
        jmp while_main
    endw_main:
        mov s, ebx
        invoke writedec, s
        call crlf
        invoke ExitProcess, 0
main endp
end main
