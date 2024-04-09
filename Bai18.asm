include irvine32.inc ; Bao gồm thư viện Irvine32 để sử dụng các hàm nhập xuất

.data ; Phần khai báo dữ liệu
    n dword ? ; Khai báo biến n để lưu số nguyên dương nhập từ bàn phím
    max_digit_count dword ? ; Khai báo biến max_digit_count để lưu số lượng chữ số lớn nhất của số nguyên dương n
    max_digit dword ? ; Khai báo biến max_digit để lưu chữ số lớn nhất của số nguyên dương n

.code ; Phần mã lệnh
main proc ; Bắt đầu quá trình thực thi của chương trình
    xor eax, eax ; Xóa thanh ghi eax

    ; Nhập số nguyên dương n từ bàn phím
    call ReadInt ; Gọi hàm ReadInt để nhập số nguyên từ bàn phím
    mov n, eax ; Di chuyển giá trị nhập được vào biến n

    mov eax, n ; Di chuyển giá trị của n vào thanh ghi eax
    mov max_digit_count, 0 ; Khởi tạo giá trị của max_digit_count bằng 0
    mov max_digit, 0 ; Khởi tạo giá trị của max_digit bằng 0

    while_loop: ; Nhãn của vòng lặp
        test eax, eax ; Kiểm tra xem giá trị của eax có bằng 0 không
        jz end_while ; Nếu bằng 0, thoát khỏi vòng lặp

        mov edx, 0 ; Xóa thanh ghi edx để sử dụng trong phép chia
        div dword ptr [digit] ; Chia eax cho 10, lưu kết quả vào eax và phần dư vào edx
        cmp edx, max_digit ; So sánh chữ số dư với max_digit
        jl skip_update_max_digit ; Nếu chữ số dư nhỏ hơn max_digit, bỏ qua việc cập nhật
        je increment_max_digit_count ; Nếu bằng, tăng max_digit_count lên 1
        mov max_digit, edx ; Nếu lớn hơn, cập nhật max_digit
        mov max_digit_count, 1 ; Đặt lại max_digit_count bằng 1 vì đã tìm thấy chữ số mới lớn hơn max_digit

    increment_max_digit_count: ; Nhãn để tăng max_digit_count lên 1
        inc max_digit_count ; Tăng max_digit_count lên 1
        jmp while_loop ; Lặp lại vòng lặp

    skip_update_max_digit: ; Nhãn để bỏ qua việc cập nhật max_digit
        jmp while_loop ; Lặp lại vòng lặp

    end_while: ; Nhãn kết thúc vòng lặp

    ; In kết quả ra màn hình
    invoke StdOut, addr max_digit_count ; In ra số lượng chữ số lớn nhất của số nguyên dương n
    invoke ExitProcess, 0 ; Kết thúc chương trình

digit dword 10 ; Biến giúp chia số nguyên cho 10

main endp ; Kết thúc quá trình thực thi của chương trình
end main ; Kết thúc chương trình
