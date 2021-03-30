section .text
global pangram
;; stores a bit vector with ascii 'A' index
;; as the adjusted beginning
;; i.e. ascii_idx - 65 for capital letters
;; ascii_idx - 32 - 65 for lowercase
pangram:
  xor r9, r9 ;; offset register
  xor r10, r10 ;; tmp used for random calcs
  xor rax, rax
_start_loop:
  xor r8, r8 ;; holds the current byte
  mov r8b, byte [r9, rdi]

  cmp r8, 0x0
  jz _end

  mov r10, r8
  sub r10, 0x20
  cmp r8, 0x5a ; if greater than 'Z'
  cmovg r8, r10

  sub r8, 0x41 ; always subtract 65
  mov cl, r8b
  mov r10, 0x1
  shl r10, cl

  cmp r10, 0x3ffffff
  jg _next_byte ;; if it's not within our range, skip it
  or rax, r10

_next_byte:
  inc r9
  jmp _start_loop

_end:
  xor rax, 0x3ffffff ;;this relies on the idea that a number xor itself is 0
  setz al ;; if all bits are set then the 0 bit will have been set
  and rax, 0xff ;; clear upper bits
	ret
