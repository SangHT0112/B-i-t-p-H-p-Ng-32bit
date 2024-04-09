include irvine32.inc
.386
.model flat, stdcall
.stack 4096
ExitProcess proto, dwExitCode:dword
.data
    n dword 99
    s dword ?
.code
main proc
    xor eax, eax
    xor ecx, ecx
    mov ebx, 1 ; Đặt giá trị ban đầu là 1
    while_main:
        cmp ebx, n
        jg endw_main
        add eax, ebx
        inc ebx
        jmp while_main
    endw_main:
        mov s, eax
        call writedec
        call crlf
        invoke ExitProcess, 0
main endp
end main
