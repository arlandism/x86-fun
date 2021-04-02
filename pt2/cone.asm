default rel

section .text
global volume
volume:
    mulss xmm0, xmm0
    mulss xmm0, xmm1
    mulss xmm0, [PI]
    divss xmm0, [THREE]
    ret

section .rodata

PI: dd 3.14159265359
THREE: dd 3.0
