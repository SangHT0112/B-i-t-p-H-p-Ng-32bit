


include irvine32.inc
include macros.inc
.386
.model flat, stdcall
.stack 4096
ExitProcess proto, dwExitCode:dword

.data
    n dword ?
    is_perfect_square dword ?

.code
main proc
    xor eax, eax

    ; Nh?p s? nguyên d??ng n t? bàn phím
    call ReadInt
    mov n, eax
mov eax, n ; Di chuy?n giá tr? c?a n vào thanh ghi eax
mov edx, 0 ; Xóa edx, ?? s? d?ng trong phép chia
mov ecx, 2 ; Kh?i t?o bi?n ??m t? 2

is_perfect_square_loop: ; Nhãn c?a vòng l?p
    cmp eax, n ; So sánh giá tr? hi?n t?i c?a eax v?i n
    jg not_perfect_square ; N?u giá tr? hi?n t?i l?n h?n n, nh?y t?i nhãn not_perfect_square

    cmp eax, n ; So sánh giá tr? hi?n t?i c?a eax v?i n
    je perfect_square ; N?u giá tr? hi?n t?i b?ng n, nh?y t?i nhãn perfect_square

    add ecx, 2 ; T?ng bi?n ??m lên 2
    mul ecx ; Nhân giá tr? hi?n t?i c?a eax v?i bi?n ??m
    jmp is_perfect_square_loop ; L?p l?i vòng l?p

perfect_square: ; Nhãn n?u n là s? chính ph??ng
    mov is_perfect_square, 1 ; Gán 1 vào bi?n is_perfect_square ?? ?ánh d?u s? chính ph??ng
    jmp end_program ; Nh?y t?i cu?i ch??ng trình

not_perfect_square: ; Nhãn n?u n không ph?i là s? chính ph??ng
    mov is_perfect_square, 0 ; Gán 0 vào bi?n is_perfect_square ?? ?ánh d?u không ph?i s? chính ph??ng

end_program: ; Cu?i ch??ng trình
cmp is_perfect_square, 1 ; So sánh giá tr? c?a is_perfect_square v?i 1
je perfect_square_msg ; N?u b?ng 1, nh?y t?i nhãn perfect_square_msg
invoke StdOut, addr not_perfect_square_msg ; In ra r?ng n không ph?i là s? chính ph??ng
invoke ExitProcess, 0 ; K?t thúc ch??ng trình

perfect_square_msg db "La so chinh phuong", 0 ; Chu?i thông báo n?u n là s? chính ph??ng
not_perfect_square_msg db "Khong phai la so chinh phuong", 0 ; Chu?i thông báo n?u n không ph?i là s? chính ph??ng
