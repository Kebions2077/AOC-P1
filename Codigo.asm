.data
a: .word 0
b: .word 0
c: .word 0
x: .word 0
resultado: .word 0

.text
main: 
    la $t7, a
    lw $t0, 0($t7)
    la $t7, b
    lw $t1, 0($t7)
    add $t2, $t0, $t1
    la $t7, c
    sw $t2, 0($t7)
    addi $t3, $t2, 3

loop:
    la $t7, c
    lw $t2, 0($t7)
    li $t4, 6
    beq $t2, $t4, fim_loop
    addi $t2, $t2, 1
    sw $t2, 0($t7)
    j loop

fim_loop:
    la $t7, resultado
    sw $t2, 0($t7)
    li $v0, 10
    syscall
