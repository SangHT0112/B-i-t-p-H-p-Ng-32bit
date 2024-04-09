include irvine32.inc
include macros.inc
.386
.model flat, stdcall
.stack 4096
ExitProcess proto, dwExitCode:dword

.data
    n dword ?
    sum dword ?

.code
main proc
    xor eax, eax

    ; Nhập số nguyên dương n từ bàn phím
    call ReadInt
    mov n, eax

    mov ecx, 1 ; Khởi tạo biến đếm

    mov sum, 0 ; Khởi tạo tổng ước bằng 0

    while_loop:
        cmp ecx, n ; So sánh biến đếm với n
        jge end_while ; Nếu biến đếm lớn hơn hoặc bằng n, kết thúc vòng lặp

        mov eax, n ; Di chuyển giá trị của n vào thanh ghi eax
        cdq ; Chia edx:eax = eax / ecx, đặt kết quả vào eax và phần dư vào edx
        idiv ecx ; Chia n cho giá trị hiện tại của biến đếm

        cmp edx, 0 ; Kiểm tra xem kết quả là số nguyên không
        je is_divisor ; Nếu có, nhảy tới nhãn is_divisor

        inc ecx ; Tăng biến đếm lên 1
        jmp while_loop ; Lặp lại

    is_divisor:
        add sum, ecx ; Cộng giá trị của biến đếm vào tổng ước
        inc ecx ; Tăng biến đếm lên 1
        jmp while_loop ; Lặp lại

    end_while:
    cmp sum, n ; So sánh tổng ước với n
    je is_perfect ; Nếu bằng nhau, nhảy tới nhãn is_perfect

    ; Nếu không, in ra rằng n không phải là số hoàn thiện
    invoke StdOut, addr not_perfect_msg
    jmp exit_program

    is_perfect:
    ; Nếu tổng ước bằng n, in ra rằng n là số hoàn thiện
    invoke StdOut, addr perfect_msg

    exit_program:
    invoke ExitProcess, 0 ; Kết thúc chương trình

perfect_msg db "La so hoan thien", 0
not_perfect_msg db "Khong phai la so hoan thien", 0

main endp
end main
