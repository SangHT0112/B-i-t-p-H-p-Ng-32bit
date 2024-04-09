include irvine32.inc
include macros.inc
.386
.model flat, stdcall
.stack 4096
ExitProcess proto, dwExitCode:dword

.data
    n dword ?
    sum dword ?
    digit dword ?

.code
main proc
    xor eax, eax

    ; Nhập số nguyên dương n từ bàn phím
    call ReadInt
    mov n, eax

    mov eax, n
    mov sum, 0

    while_loop:
        test eax, eax
        jz end_while

        mov edx, 0
        div dword ptr [digit]
        add sum, edx
        jmp while_loop

    end_while:
    invoke StdOut, addr sum
    invoke ExitProcess, 0

digit dword 10

main endp
end main
