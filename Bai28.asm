;Bài 28:Tìm ra số nguyên dương n nhỏ nhất sao cho 1+2+3+...+n >10000 .
include irvine32.inc ; Bao gồm thư viện Irvine32 để sử dụng các hàm nhập xuất

.data ; Phần khai báo dữ liệu
    sum_limit dword 10000 ; Giới hạn tổng cần vượt qua
    n dword ? ; Khai báo biến n để lưu số nguyên dương n nhỏ nhất thỏa mãn điều kiện

.code ; Phần mã lệnh
main proc ; Bắt đầu quá trình thực thi của chương trình
    xor eax, eax ; Xóa thanh ghi eax

    mov ecx, 1 ; Đặt giá trị ban đầu của ecx là 1 (bắt đầu từ 1)
    mov eax, 0 ; Xóa giá trị của thanh ghi eax để tính tổng

    ; Tìm số nguyên dương n nhỏ nhất sao cho tổng từ 1 đến n lớn hơn 10000
    while_loop:
        add eax, ecx ; Cộng giá trị của ecx vào tổng
        cmp eax, sum_limit ; So sánh tổng với giới hạn
        jg end_while ; Nếu tổng lớn hơn giới hạn, thoát khỏi vòng lặp

        inc ecx ; Tăng giá trị của ecx lên 1 để kiểm tra số tiếp theo
        jmp while_loop ; Lặp lại vòng lặp

    ; Lưu giá trị của ecx vào biến n
    mov n, ecx

    ; In kết quả ra màn hình
    invoke StdOut, addr n ; In ra màn hình số nguyên dương n nhỏ nhất thỏa mãn điều kiện
    invoke ExitProcess, 0 ; Kết thúc chương trình

end_while:
main endp ; Kết thúc quá trình thực thi của chương trình
end main ; Kết thúc chương trình
