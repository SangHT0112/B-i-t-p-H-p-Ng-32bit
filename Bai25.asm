;Bài 25:Kiểm tra số nguyên n có dạng 2^k hay không ?
include irvine32.inc ; Bao gồm thư viện Irvine32 để sử dụng các hàm nhập xuất

.data ; Phần khai báo dữ liệu
    n dword ? ; Khai báo biến n để lưu số nguyên nhập từ bàn phím
    is_power_of_two dword ? ; Biến lưu trạng thái kiểm tra số nguyên n có phải là lũy thừa của 2 hay không

.code ; Phần mã lệnh
main proc ; Bắt đầu quá trình thực thi của chương trình
    xor eax, eax ; Xóa thanh ghi eax

    ; Nhập số nguyên n từ bàn phím
    call ReadInt ; Gọi hàm ReadInt để nhập số nguyên từ bàn phím
    mov n, eax ; Di chuyển giá trị nhập được vào biến n

    mov ecx, 0 ; Đặt giá trị ban đầu của ecx là 0 (đếm số lần phép chia)
    mov ebx, 1 ; Đặt giá trị ban đầu của ebx là 1 (bắt đầu từ 2^0 = 1)
    mov is_power_of_two, 0 ; Giả sử ban đầu rằng n không phải là lũy thừa của 2

    while_loop: ; Nhãn của vòng lặp
        cmp ebx, n ; So sánh giá trị của ebx với n
        jge end_while ; Nếu giá trị của ebx lớn hơn hoặc bằng n, thoát khỏi vòng lặp

        shl ebx, 1 ; Dịch trái ebx để nhân lên 2
        inc ecx ; Tăng giá trị của ecx lên 1 (đếm số lần dịch trái)

        cmp ebx, n ; So sánh lại giá trị của ebx với n
        je set_power_of_two ; Nếu bằng nhau, n là lũy thừa của 2, đặt is_power_of_two thành 1 và thoát khỏi vòng lặp

        jmp while_loop ; Lặp lại vòng lặp nếu chưa đạt được điều kiện

    end_while: ; Nhãn kết thúc vòng lặp

    set_power_of_two: ; Nhãn để đặt biến is_power_of_two thành 1
        mov is_power_of_two, 1 ; Đặt is_power_of_two thành 1 khi n là lũy thừa của 2

    ; In kết quả ra màn hình
    invoke StdOut, addr is_power_of_two ; In ra trạng thái kiểm tra số nguyên n có phải là lũy thừa của 2 hay không
    invoke ExitProcess, 0 ; Kết thúc chương trình

main endp ; Kết thúc quá trình thực thi của chương trình
end main ; Kết thúc chương trình
