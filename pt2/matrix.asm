section .text
global index
index:
	; rdi: matrix
	; rsi: rows
	; rdx: cols
	; rcx: rindex
	; r8: cindex
	; value = rdi + 4(rdx * rcx + r8)
	mov rax, rdx
	imul rax, rcx
	add rax, r8
	lea rax, rdi[rax * 4]
	mov rax, [rax]
	ret
