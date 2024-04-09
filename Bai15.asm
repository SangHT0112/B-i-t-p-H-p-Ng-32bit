include irvine32.inc ; Bao g?m th? vi?n Irvine32 ?? s? d?ng các hàm nh?p xu?t

.data ; Ph?n khai báo d? li?u
    n dword ? ; Khai báo bi?n n ?? l?u s? nguyên d??ng nh?p t? bàn phím
    reversed_number dword ? ; Khai báo bi?n reversed_number ?? l?u s? ??o ng??c c?a s? nguyên d??ng n

.code ; Ph?n mã l?nh
main proc ; B?t ??u quá trình th?c thi c?a ch??ng trình
    xor eax, eax ; Xóa thanh ghi eax

    ; Nh?p s? nguyên d??ng n t? bàn phím
    call ReadInt ; G?i hàm ReadInt ?? nh?p s? nguyên t? bàn phím
    mov n, eax ; Di chuy?n giá tr? nh?p ???c vào bi?n n

    mov eax, n ; Di chuy?n giá tr? c?a n vào thanh ghi eax
    mov reversed_number, 0 ; Kh?i t?o giá tr? c?a reversed_number b?ng 0

    while_loop: ; Nhãn c?a vòng l?p
        test eax, eax ; Ki?m tra xem giá tr? c?a eax có b?ng 0 không
        jz end_while ; N?u b?ng 0, thoát kh?i vòng l?p

        mov edx, 0 ; Xóa thanh ghi edx ?? s? d?ng trong phép chia
        div dword ptr [digit] ; Chia eax cho 10, l?u k?t qu? vào eax và ph?n d? vào edx
        imul reversed_number, 10 ; Nhân reversed_number v?i 10 ?? d?ch sang trái m?t ch? s?
        add reversed_number, edx ; C?ng ch? s? d? vào reversed_number

        jmp while_loop ; L?p l?i vòng l?p

    end_while: ; Nhãn k?t thúc vòng l?p

    ; In k?t qu? ra màn hình
    invoke StdOut, addr reversed_number ; In ra s? ??o ng??c c?a s? nguyên d??ng n
    invoke ExitProcess, 0 ; K?t thúc ch??ng trình

digit dword 10 ; Bi?n giúp chia s? nguyên cho 10

main endp ; K?t thúc quá trình th?c thi c?a ch??ng trình
end main ; K?t thúc ch??ng trình
