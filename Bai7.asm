include irvine32.inc
include macros.inc
.386
.model flat, stdcall
.stack 4096
ExitProcess proto, dwExitCode:dword

.data
    n dword ?
    is_prime dword ?

.code
main proc
    xor eax, eax

    ; Nhập số nguyên dương n từ bàn phím
    call ReadInt
    mov n, eax

    cmp n, 1 ; Kiểm tra xem n có bằng 1 không
    je not_prime ; Nếu có, nhảy tới nhãn not_prime

    mov ecx, 2 ; Khởi tạo biến đếm

    while_loop:
        cmp ecx, n ; So sánh biến đếm với n
        jge end_while ; Nếu biến đếm lớn hơn hoặc bằng n, kết thúc vòng lặp

        mov eax, n ; Di chuyển giá trị của n vào thanh ghi eax
        cdq ; Chia edx:eax = eax / ecx, đặt kết quả vào eax và phần dư vào edx
        idiv ecx ; Chia n cho giá trị hiện tại của biến đếm

        cmp edx, 0 ; Kiểm tra xem kết quả là số nguyên không
        je not_prime ; Nếu có, nhảy tới nhãn not_prime

        inc ecx ; Tăng biến đếm lên 1
        jmp while_loop ; Lặp lại

    end_while:
    ; Nếu không có ước nào khác ngoài 1 và chính nó, nó là số nguyên tố
    mov is_prime, 1 ; Gán 1 vào biến is_prime để đánh dấu số nguyên tố
    jmp end_program ; Nhảy tới cuối chương trình

    not_prime:
    ; Nếu có ước khác 1 và chính nó, nó không phải là số nguyên tố
    mov is_prime, 0 ; Gán 0 vào biến is_prime để đánh dấu không phải số nguyên tố

    end_program:
    ; In kết quả ra màn hình
    cmp is_prime, 1 ; Kiểm tra xem n có phải là số nguyên tố không
    je prime_msg ; Nếu là số nguyên tố, nhảy tới nhãn prime_msg

    invoke StdOut, addr not_prime_msg ; In ra rằng n không phải là số nguyên tố
    jmp exit_program ; Nhảy tới cuối chương trình

    prime_msg:
    invoke StdOut, addr prime_msg ; In ra rằng n là số nguyên tố

    exit_program:
    invoke ExitProcess, 0 ; Kết thúc chương trình

not_prime_msg db "Khong phai la so nguyen to", 0
prime_msg db "La so nguyen to", 0

main endp
end main
