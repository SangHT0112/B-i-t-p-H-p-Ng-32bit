;Bài 27:Liệt kê tất cả các ước số của số nguyên dương n
include irvine32.inc ; Bao gồm thư viện Irvine32 để sử dụng các hàm nhập xuất

.data ; Phần khai báo dữ liệu
    n dword ? ; Khai báo biến n để lưu số nguyên nhập từ bàn phím

.code ; Phần mã lệnh
main proc ; Bắt đầu quá trình thực thi của chương trình
    xor eax, eax ; Xóa thanh ghi eax

    ; Nhập số nguyên n từ bàn phím
    call ReadInt ; Gọi hàm ReadInt để nhập số nguyên từ bàn phím
    mov n, eax ; Di chuyển giá trị nhập được vào biến n

    mov ecx, 1 ; Đặt giá trị ban đầu của ecx là 1 (bắt đầu từ ước số nhỏ nhất)
    
    ; In ra màn hình các ước số của n
    print_divisors_loop:
        mov edx, 0 ; Xóa thanh ghi edx để sử dụng trong phép chia
        mov eax, n ; Di chuyển giá trị của n vào thanh ghi eax
        div ecx ; Chia n cho ecx, lưu kết quả vào eax và phần dư vào edx
        cmp edx, 0 ; So sánh phần dư với 0 để kiểm tra xem ecx có phải là ước số của n hay không
        je print_divisor ; Nếu phần dư bằng 0, in ra màn hình
        inc ecx ; Tăng giá trị của ecx lên 1 để kiểm tra ước số tiếp theo
        cmp ecx, n ; So sánh ecx với n để kiểm tra điều kiện dừng vòng lặp
        jle print_divisors_loop ; Nếu ecx nhỏ hơn hoặc bằng n, lặp lại vòng lặp

    ; Kết thúc chương trình
    invoke ExitProcess, 0 ; Kết thúc chương trình

print_divisor:
    ; In ước số ra màn hình
    invoke StdOut, addr ecx ; In ra màn hình ước số của n
    invoke StdOut, addr newline ; Xuống dòng
    inc ecx ; Tăng giá trị của ecx lên 1 để kiểm tra ước số tiếp theo
    jmp print_divisors_loop ; Quay lại vòng lặp để kiểm tra các ước số tiếp theo

newline db 0dh, 0ah, 0 ; Dòng mới

main endp ; Kết thúc quá trình thực thi của chương trình
end main ; Kết thúc chương trình
