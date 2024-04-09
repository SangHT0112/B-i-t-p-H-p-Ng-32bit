
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

mov eax, n ; Di chuyển giá trị của n vào thanh ghi eax
mov sum, 0 ; Khởi tạo sum là tổng các chữ số chẵn
while_loop: ; Nhãn của vòng lặp
    test eax, eax ; Kiểm tra xem eax có bằng 0 không
    jz end_while ; Nếu bằng 0, thoát khỏi vòng lặp

    mov edx, 0 ; Xóa edx, để sử dụng trong phép chia
    div dword ptr [digit] ; Chia eax cho 10, lưu kết quả vào eax và phần dư vào edx
    test edx, 1 ; Kiểm tra xem phần dư có phải là số lẻ không
    jnz skip_odd_digit ; Nếu là số lẻ, bỏ qua

    add sum, edx ; Cộng phần dư vào tổng sum

    skip_odd_digit: ; Nhãn để bỏ qua phần tử lẻ
    jmp while_loop ; Lặp lại vòng lặp

end_while: ; Kết thúc vòng lặp
invoke StdOut, addr sum ; In ra tổng các chữ số chẵn
invoke ExitProcess, 0 ; Kết thúc chương trình

digit dword 10 ; Biến giúp chia số nguyên cho 10
