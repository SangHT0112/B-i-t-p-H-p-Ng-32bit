;Bài 24: Hãy kiểm tra các chữ số của số nguyên dương n có giảm dần từ trái sang phải hay không ?

include irvine32.inc ; Bao gồm thư viện Irvine32 để sử dụng các hàm nhập xuất

.data ; Phần khai báo dữ liệu
    n dword ? ; Khai báo biến n để lưu số nguyên dương nhập từ bàn phím
    is_decreasing dword ? ; Biến lưu trạng thái kiểm tra số nguyên dương n có các chữ số giảm dần hay không

.code ; Phần mã lệnh
main proc ; Bắt đầu quá trình thực thi của chương trình
    xor eax, eax ; Xóa thanh ghi eax

    ; Nhập số nguyên dương n từ bàn phím
    call ReadInt ; Gọi hàm ReadInt để nhập số nguyên từ bàn phím
    mov n, eax ; Di chuyển giá trị nhập được vào biến n

    mov eax, n ; Di chuyển giá trị của n vào thanh ghi eax
    mov ebx, eax ; Lưu giá trị của n vào ebx để so sánh về sau
    mov is_decreasing, 1 ; Giả sử ban đầu rằng tất cả các chữ số giảm dần

    while_loop: ; Nhãn của vòng lặp
        test eax, eax ; Kiểm tra xem giá trị của eax có bằng 0 không
        jz end_while ; Nếu bằng 0, thoát khỏi vòng lặp

        mov edx, 0 ; Xóa thanh ghi edx để sử dụng trong phép chia
        div dword ptr [digit] ; Chia eax cho 10, lưu kết quả vào eax và phần dư vào edx

        ; So sánh chữ số hiện tại với chữ số tiếp theo
        mov ecx, eax ; Lưu chữ số hiện tại vào ecx
        mov eax, edx ; Lấy chữ số tiếp theo
        cmp ecx, eax ; So sánh hai chữ số
        jl set_not_decreasing ; Nếu chữ số hiện tại nhỏ hơn chữ số tiếp theo, đặt biến is_decreasing thành 0 và thoát khỏi vòng lặp

        jmp while_loop ; Lặp lại vòng lặp

    set_not_decreasing: ; Nhãn để đặt biến is_decreasing thành 0
        mov is_decreasing, 0 ; Đặt biến is_decreasing thành 0
        jmp end_while ; Kết thúc vòng lặp

    end_while: ; Nhãn kết thúc vòng lặp

    ; In kết quả ra màn hình
    invoke StdOut, addr is_decreasing ; In ra trạng thái kiểm tra số nguyên dương n có các chữ số giảm dần hay không
    invoke ExitProcess, 0 ; Kết thúc chương trình

digit dword 10 ; Biến giúp chia số nguyên cho 10

main endp ; Kết thúc quá trình thực thi của chương trình
end main ; Kết thúc chương trình
