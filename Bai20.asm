include irvine32.inc ; Bao gồm thư viện Irvine32 để sử dụng các hàm nhập xuất

.data ; Phần khai báo dữ liệu
    n dword ? ; Khai báo biến n để lưu số nguyên dương nhập từ bàn phím
    is_all_odd dword ? ; Biến lưu trạng thái kiểm tra số nguyên dương n có toàn chữ số lẻ hay không

.code ; Phần mã lệnh
main proc ; Bắt đầu quá trình thực thi của chương trình
    xor eax, eax ; Xóa thanh ghi eax

    ; Nhập số nguyên dương n từ bàn phím
    call ReadInt ; Gọi hàm ReadInt để nhập số nguyên từ bàn phím
    mov n, eax ; Di chuyển giá trị nhập được vào biến n

    mov eax, n ; Di chuyển giá trị của n vào thanh ghi eax
    mov is_all_odd, 1 ; Giả sử ban đầu rằng tất cả các chữ số đều là lẻ

    while_loop: ; Nhãn của vòng lặp
        test eax, eax ; Kiểm tra xem giá trị của eax có bằng 0 không
        jz end_while ; Nếu bằng 0, thoát khỏi vòng lặp

        mov edx, 0 ; Xóa thanh ghi edx để sử dụng trong phép chia
        div dword ptr [digit] ; Chia eax cho 10, lưu kết quả vào eax và phần dư vào edx
        test edx, 1 ; Kiểm tra xem chữ số dư có phải là số lẻ không
        jz set_not_all_odd ; Nếu là số chẵn, đặt biến is_all_odd thành 0 và thoát khỏi vòng lặp

        jmp while_loop ; Lặp lại vòng lặp

    set_not_all_odd: ; Nhãn để đặt biến is_all_odd thành 0
        mov is_all_odd, 0 ; Đặt biến is_all_odd thành 0
        jmp end_while ; Kết thúc vòng lặp

    end_while: ; Nhãn kết thúc vòng lặp

    ; In kết quả ra màn hình
    invoke StdOut, addr is_all_odd ; In ra trạng thái kiểm tra số nguyên dương n có toàn chữ số lẻ hay không
    invoke ExitProcess, 0 ; Kết thúc chương trình

digit dword 10 ; Biến giúp chia số nguyên cho 10

main endp ; Kết thúc quá trình thực thi của chương trình
end main ; Kết thúc chương trình
