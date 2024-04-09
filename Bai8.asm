


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

    ; Nh?p s? nguy�n d??ng n t? b�n ph�m
    call ReadInt
    mov n, eax
mov eax, n ; Di chuy?n gi� tr? c?a n v�o thanh ghi eax
mov edx, 0 ; X�a edx, ?? s? d?ng trong ph�p chia
mov ecx, 2 ; Kh?i t?o bi?n ??m t? 2

is_perfect_square_loop: ; Nh�n c?a v�ng l?p
    cmp eax, n ; So s�nh gi� tr? hi?n t?i c?a eax v?i n
    jg not_perfect_square ; N?u gi� tr? hi?n t?i l?n h?n n, nh?y t?i nh�n not_perfect_square

    cmp eax, n ; So s�nh gi� tr? hi?n t?i c?a eax v?i n
    je perfect_square ; N?u gi� tr? hi?n t?i b?ng n, nh?y t?i nh�n perfect_square

    add ecx, 2 ; T?ng bi?n ??m l�n 2
    mul ecx ; Nh�n gi� tr? hi?n t?i c?a eax v?i bi?n ??m
    jmp is_perfect_square_loop ; L?p l?i v�ng l?p

perfect_square: ; Nh�n n?u n l� s? ch�nh ph??ng
    mov is_perfect_square, 1 ; G�n 1 v�o bi?n is_perfect_square ?? ?�nh d?u s? ch�nh ph??ng
    jmp end_program ; Nh?y t?i cu?i ch??ng tr�nh

not_perfect_square: ; Nh�n n?u n kh�ng ph?i l� s? ch�nh ph??ng
    mov is_perfect_square, 0 ; G�n 0 v�o bi?n is_perfect_square ?? ?�nh d?u kh�ng ph?i s? ch�nh ph??ng

end_program: ; Cu?i ch??ng tr�nh
cmp is_perfect_square, 1 ; So s�nh gi� tr? c?a is_perfect_square v?i 1
je perfect_square_msg ; N?u b?ng 1, nh?y t?i nh�n perfect_square_msg
invoke StdOut, addr not_perfect_square_msg ; In ra r?ng n kh�ng ph?i l� s? ch�nh ph??ng
invoke ExitProcess, 0 ; K?t th�c ch??ng tr�nh

perfect_square_msg db "La so chinh phuong", 0 ; Chu?i th�ng b�o n?u n l� s? ch�nh ph??ng
not_perfect_square_msg db "Khong phai la so chinh phuong", 0 ; Chu?i th�ng b�o n?u n kh�ng ph?i l� s? ch�nh ph??ng
