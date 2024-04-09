include irvine32.inc ; Bao gồm thư viện Irvine32 để sử dụng các hàm nhập xuất

.data ; Phần khai báo dữ liệu
    n dword ? ; Khai báo biến n để lưu số nguyên dương nhập từ bàn phím
    product dword ? ; Khai báo biến product để lưu tích các chữ số lẻ của số nguyên dương n
    digit dword ? ; Khai báo biến digit để lưu từng chữ số của số nguyên dương n khi thực hiện phép chia

.code ; Phần mã lệnh
main proc ; Bắt đầu quá trình thực thi của chương trình
    xor eax, eax ; Xóa thanh ghi eax

    ; Nhập số nguyên dương n từ bàn phím
    call ReadInt ; Gọi hàm ReadInt để nhập số nguyên từ bàn phím
    mov n, eax ; Di chuyển giá trị nhập được vào biến n

    mov eax, n ; Di chuyển giá trị của n vào thanh ghi eax
    mov product, 1 ; Khởi tạo giá trị của product bằng 1 để tính tích các chữ số lẻ

    while_loop: ; Nhãn của vòng lặp
        test eax, eax ; Kiểm tra xem giá trị của eax có bằng 0 không
        jz end_while ; Nếu bằng 0, thoát khỏi vòng lặp

        mov edx, 0 ; Xóa thanh ghi edx để sử dụng trong phép chia
        div dword ptr [digit] ; Chia eax cho 10, lưu kết quả vào eax và phần dư vào edx
        test edx, 1 ; Kiểm tra xem phần dư có phải là số lẻ không
        jnz multiply_odd_digit ; Nếu là số lẻ, nhảy tới nhãn multiply_odd_digit

        jmp while_loop ; Nếu không, lặp lại vòng lặp

    multiply_odd_digit: ; Nhãn để nhân chữ số lẻ vào tích
        imul product, edx ; Nhân chữ số lẻ vào tích
        jmp while_loop ; Lặp lại vòng lặp

    end_while: ; Nhãn kết thúc vòng lặp

    ; In kết quả ra màn hình
    invoke StdOut, addr product ; In ra tích các chữ số lẻ của số nguyên dương n
    invoke ExitProcess, 0 ; Kết thúc chương trình

digit dword 10 ; Biến giúp chia số nguyên cho 10

main endp ; Kết thúc quá trình thực thi của chương trình
end main ; Kết thúc chương trình
