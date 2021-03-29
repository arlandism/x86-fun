section .text
global binary_convert
binary_convert:
  xor rax, rax
  mov r9, [rdi]
_loop_start:
  mov r8, r9
  shr r9, 8
  and	r8, 0xff ;; extract and clear rightmost byte, store in r8
  jz _end ;; zero bit set by the and, end if null byte

  ;; make room for next bit
  shl rax, 1

  ;; did we match 1 or 0; either way, add that to the pattern
  mov r11, 1
  cmp r8, 0x31
  cmovz r10, r11

  mov r11, 0
  cmp r8, 0x30
  cmovz r10, r11

  or rax, r10

  jmp _loop_start
_end:
	ret

