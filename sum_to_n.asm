section .text
global sum_to_n
sum_to_n:
  xor rax, rax
  mov r8, rdi
_loop:
  cmp r8, $0
  jz _end
  add rax, r8
  dec r8
  jmp _loop
_end:
	ret
