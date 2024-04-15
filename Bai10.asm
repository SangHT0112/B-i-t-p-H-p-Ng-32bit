; Khai báo các thư viện và mô hình bộ nhớ
include irvine32.inc
include macros.inc
.386
.model flat, stdcall
.stack 4096
ExitProcess proto, dwExitCode:dword

; Khai báo phần dữ liệu
.data
    n dword ?       ; Biến để lưu trữ số nguyên dương nhập từ bàn phím
    sum dword ?     ; Biến để tính tổng các chữ số của số nguyên
    digit dword 10   ; Biến để lưu trữ giá trị 10

; Phần mã lệnh
.code
main proc
    xor eax, eax        ; Đặt eax về 0 để chuẩn bị cho việc nhập dữ liệu

    ; Nhập số nguyên dương n từ bàn phím
    call ReadInt
    mov n, eax          ; Lưu giá trị số nguyên vào biến n

    mov eax, n          ; Đặt lại giá trị của eax là n để tính tổng các chữ số
    mov sum, 0          ; Khởi tạo tổng các chữ số bằng 0

    ; Bắt đầu vòng lặp để tính tổng các chữ số
    while_loop:
        test eax, eax   ; Kiểm tra xem giá trị của eax có bằng 0 hay không
        jz end_while    ; Nếu bằng 0, kết thúc vòng lặp

        mov edx, 0      ; Đặt edx bằng 0 để chuẩn bị cho việc lấy chữ số cuối cùng
        div dword ptr [digit]   ; Chia eax cho 10 và lưu phần dư vào edx
        add sum, edx    ; Cộng phần dư vào tổng các chữ số
        jmp while_loop  ; Nhảy lại đầu vòng lặp để tiếp tục

    ; Kết thúc vòng lặp
    end_while:
    
    ; Hiển thị tổng các chữ số ra màn hình
    invoke StdOut, addr sum
    ; Kết thúc chương trình
    invoke ExitProcess, 0

digit dword 10      ; Gán giá trị 10 cho biến digit để sử dụng trong việc chia

main endp           ; Kết thúc hàm main
end main            ; Kết thúc chương trình
