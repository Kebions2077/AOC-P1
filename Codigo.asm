.data
a: .word 1
b: .word 1
c: .word 0
x: .word 0
resultado: .word 0

.text
main:
    lw $t0, 0(a)
    lw $t1, 0(b)
    add $t2, $t0, $t1
    sw $t2, 0(c)
    addi $t3, $t2, 3

loop:
    lw $t2, 0(c)
    li $t4, 6
    beq $t2, $t4, fim_loop
    addi $t2, $t2, 1
    sw $t2, 0(c)
    j loop

fim_loop:
    sw $t2, 0(resultado)
    li $v0, 10
    syscall
