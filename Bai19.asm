include irvine32.inc ; Bao gồm thư viện Irvine32 để sử dụng các hàm nhập xuất

.data ; Phần khai báo dữ liệu
    n dword ? ; Khai báo biến n để lưu số nguyên dương nhập từ bàn phím
    min_digit_count dword ? ; Khai báo biến min_digit_count để lưu số lượng chữ số nhỏ nhất của số nguyên dương n
    min_digit dword ? ; Khai báo biến min_digit để lưu chữ số nhỏ nhất của số nguyên dương n

.code ; Phần mã lệnh
main proc ; Bắt đầu quá trình thực thi của chương trình
    xor eax, eax ; Xóa thanh ghi eax

    ; Nhập số nguyên dương n từ bàn phím
    call ReadInt ; Gọi hàm ReadInt để nhập số nguyên từ bàn phím
    mov n, eax ; Di chuyển giá trị nhập được vào biến n

    mov eax, n ; Di chuyển giá trị của n vào thanh ghi eax
    mov min_digit_count, 0 ; Khởi tạo giá trị của min_digit_count bằng 0
    mov min_digit, 9 ; Khởi tạo giá trị của min_digit bằng 9

    while_loop: ; Nhãn của vòng lặp
        test eax, eax ; Kiểm tra xem giá trị của eax có bằng 0 không
        jz end_while ; Nếu bằng 0, thoát khỏi vòng lặp

        mov edx, 0 ; Xóa thanh ghi edx để sử dụng trong phép chia
        div dword ptr [digit] ; Chia eax cho 10, lưu kết quả vào eax và phần dư vào edx
        cmp edx, min_digit ; So sánh chữ số dư với min_digit
        jg skip_update_min_digit ; Nếu chữ số dư lớn hơn min_digit, bỏ qua việc cập nhật
        je increment_min_digit_count ; Nếu bằng, tăng min_digit_count lên 1
        mov min_digit, edx ; Nếu nhỏ hơn, cập nhật min_digit
        mov min_digit_count, 1 ; Đặt lại min_digit_count bằng 1 vì đã tìm thấy chữ số mới nhỏ nhất

    increment_min_digit_count: ; Nhãn để tăng min_digit_count lên 1
        inc min_digit_count ; Tăng min_digit_count lên 1
        jmp while_loop ; Lặp lại vòng lặp

    skip_update_min_digit: ; Nhãn để bỏ qua việc cập nhật min_digit
        jmp while_loop ; Lặp lại vòng lặp

    end_while: ; Nhãn kết thúc vòng lặp

    ; In kết quả ra màn hình
    invoke StdOut, addr min_digit_count ; In ra số lượng chữ số nhỏ nhất của số nguyên dương n
    invoke ExitProcess, 0 ; Kết thúc chương trình

digit dword 10 ; Biến giúp chia số nguyên cho 10

main endp ; Kết thúc quá trình thực thi của chương trình
end main ; Kết thúc chương trình
