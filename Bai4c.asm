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

    mov ebx, 1 ; Khởi tạo tích là 1
    mov ecx, 2 ; Khởi tạo biến đếm là 2 (bắt đầu từ 2)
    while_loop:
        cmp ecx, n ; So sánh biến đếm với n
        jg end_while ; Nếu biến đếm vượt quá n, kết thúc vòng lặp
        imul ebx, ebx, ecx ; Nhân tích với biến đếm
        add ecx, 2 ; Tăng biến đếm lên 2 để lấy số chẵn tiếp theo
        jmp while_loop ; Lặp lại

    end_while:
        mov s, ebx ; Lưu kết quả vào biến s
        invoke writedec, s ; In kết quả ra màn hình
        call crlf ; Xuống dòng
        invoke ExitProcess, 0 ; Kết thúc chương trình
main endp
end main
