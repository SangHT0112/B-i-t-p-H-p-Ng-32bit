; Bài 29:Hãy sử dụng vòng lặp để xuất tất cả các ký tự từ A tới Z 
include irvine32.inc ; Bao gồm thư viện Irvine32 để sử dụng các hàm nhập xuất

.data ; Phần khai báo dữ liệu

.code ; Phần mã lệnh
main proc ; Bắt đầu quá trình thực thi của chương trình
    mov ecx, 'A' ; Đặt giá trị ban đầu của ecx là ký tự 'A'

    ; Sử dụng vòng lặp để xuất tất cả các ký tự từ A đến Z
    print_loop:
        ; Xuất ký tự
        mov eax, ecx ; Di chuyển giá trị của ecx (ký tự) vào thanh ghi eax
        call WriteChar ; Gọi hàm WriteChar để xuất ký tự ra màn hình

        ; Tăng giá trị của ecx lên 1 để xuất ký tự tiếp theo
        inc ecx

        ; Kiểm tra điều kiện dừng vòng lặp (nếu đã xuất hết các ký tự từ A đến Z)
        cmp ecx, 'Z' ; So sánh giá trị của ecx với ký tự 'Z'
        jle print_loop ; Nếu nhỏ hơn hoặc bằng 'Z', lặp lại vòng lặp

    ; Kết thúc chương trình
    invoke ExitProcess, 0 ; Kết thúc chương trình

main endp ; Kết thúc quá trình thực thi của chương trình
end main ; Kết thúc chương trình
