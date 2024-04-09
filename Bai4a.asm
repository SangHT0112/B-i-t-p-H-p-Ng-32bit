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

    mov ebx, 1 ; Khởi tạo tổng là 1
    mov ecx, 1 ; Khởi tạo chỉ số vòng lặp là 1

    while_loop:
        cmp ecx, n ; So sánh chỉ số với n
        jg end_while ; Nếu chỉ số vượt quá n, kết thúc vòng lặp
        imul ebx, ebx, ecx ; Tính tích và lưu vào ebx
        inc ecx ; Tăng chỉ số lên 1
        jmp while_loop ; Lặp lại

    end_while:
        mov s, ebx ; Lưu kết quả vào biến s
        invoke writedec, s ; In kết quả ra màn hình
        call crlf ; Xuống dòng
        invoke ExitProcess, 0 ; Kết thúc chương trình
main endp
end main
