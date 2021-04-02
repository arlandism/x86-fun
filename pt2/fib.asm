section .text
global fib
fib:
	push rbp
	mov rbp, rsp

	push rdi ;; save so that we can use the same register for both recursive calls w/o mutation
	mov rax, rdi
	cmp rax, 1
	jle _end

	dec rdi
	call fib
	push rax

	dec rdi
	call fib
	pop r8
	add rax, r8
_end:
	pop rdi ;; so caller can reuse (i.e. for the 2nd recursive call)
	pop rbp
	ret
