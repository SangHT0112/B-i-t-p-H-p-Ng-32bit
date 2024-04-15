Bài 1b. S(n)=1+3+5+...+(2k+1).

include irvine32.inc

.data
    n dword ?
    s dword ?

.code
main proc
    xor eax, eax            ; Xóa thanh ghi EAX
    call ReadInt            ; Gọi hàm ReadInt để nhập n từ bàn phím
    mov n, eax              ; Di chuyển giá trị đã nhập từ EAX vào biến n

    xor eax, eax            ; Xóa EAX
    xor ecx, ecx            ; Xóa ECX
    mov ebx, 0              ; Đặt giá trị ban đầu của tổng là 0

while_main:
    cmp ecx, n              ; So sánh ECX với n
    jg endw_main            ; Nếu ECX > n thì thoát khỏi vòng lặp

    imul eax, ebx, 2        ; Nhân tổng hiện tại (EBX) với 2 để tìm số lẻ tiếp theo
    inc eax                 ; Tăng kết quả lên 1 để tạo thành số lẻ
    add ebx, eax            ; Cộng số lẻ tìm được vào tổng
    inc ecx                 ; Tăng ECX lên 1
    jmp while_main          ; Lặp lại quá trình cho đến khi ECX đạt được n

endw_main:
    mov s, ebx              ; Di chuyển giá trị tổng vào biến s
    invoke writedec, s      ; Gọi hàm writedec để in ra tổng đã tính
    call crlf               ; Xuống dòng
    invoke ExitProcess, 0   ; Kết thúc chương trình

main endp
end main
