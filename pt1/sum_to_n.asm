section .text
global sum_to_n
sum_to_n:
  xor rax, rax
_loop:
  add rax, rdi
  sub rdi, 1
  jg _loop
	ret
