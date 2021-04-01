section .text
global binary_convert
binary_convert:
  xor rax, rax
_loop_start:
  movzx r9, byte [rdi]
  cmp r9, 0
  jz _end ;; zero bit set by the and, end if null byte
  shl rax, 1 ;; make room for next bit
  and r9, 1 ;; check the rightmost bit - 0x31 ('1') will have a 1 set
  or rax, r9 ;; add bit to return result
  inc rdi
  jmp _loop_start
_end:
	ret

