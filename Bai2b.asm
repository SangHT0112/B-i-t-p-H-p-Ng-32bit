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

    ; Nhập giá trị của n từ bàn phím
    call ReadInt
    mov n, eax

    xor eax, eax
    xor ecx, ecx
    mov ebx, 0 ; Đặt giá trị ban đầu là 0
    while_main:
        cmp ecx, n
        jg endw_main
        mov edx, ecx ; Lưu giá trị của ecx vào edx
        shl edx, 1  ; Nhân cho 2
        inc edx ; Tăng giá trị của edx lên 1 để lấy 2k+1
        mul edx, edx ; Lấy bình phương của 2k+1
        add ebx, edx ; Cộng vào tổng
        inc ecx ; Tăng chỉ số của chuỗi lên 1
        jmp while_main
    endw_main:
        mov s, ebx
        invoke writedec, s
        call crlf
        invoke ExitProcess, 0
main endp
end main
