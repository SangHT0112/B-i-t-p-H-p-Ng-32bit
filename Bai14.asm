include irvine32.inc ; Bao gồm thư viện Irvine32 để sử dụng các hàm nhập xuất

.data ; Phần khai báo dữ liệu
    n dword ? ; Khai báo biến n để lưu số nguyên dương nhập từ bàn phím
    first_digit dword ? ; Khai báo biến first_digit để lưu chữ số đầu tiên của số nguyên dương n

.code ; Phần mã lệnh
main proc ; Bắt đầu quá trình thực thi của chương trình
    xor eax, eax ; Xóa thanh ghi eax

    ; Nhập số nguyên dương n từ bàn phím
    call ReadInt ; Gọi hàm ReadInt để nhập số nguyên từ bàn phím
    mov n, eax ; Di chuyển giá trị nhập được vào biến n

    mov eax, n ; Di chuyển giá trị của n vào thanh ghi eax
    mov edx, 0 ; Xóa thanh ghi edx để sử dụng trong phép chia
    mov ebx, 10 ; Gán giá trị 10 vào thanh ghi ebx để sử dụng cho phép chia

    find_first_digit: ; Nhãn của vòng lặp
        div ebx ; Chia eax cho 10, lưu phần nguyên vào eax và phần dư vào edx
        cmp eax, 0 ; So sánh giá trị của eax với 0
        je end_find_first_digit ; Nếu bằng 0, thoát khỏi vòng lặp
        mov first_digit, edx ; Di chuyển giá trị của phần dư vào biến first_digit

    end_find_first_digit: ; Nhãn kết thúc vòng lặp

    ; In kết quả ra màn hình
    invoke StdOut, addr first_digit ; In ra chữ số đầu tiên của số nguyên dương n
    invoke ExitProcess, 0 ; Kết thúc chương trình

main endp ; Kết thúc quá trình thực thi của chương trình
end main ; Kết thúc chương trình
