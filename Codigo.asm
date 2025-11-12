
.data
    a: .word 0
    b: .word 0
    c: .word 0
    resultado: .word 0

.text
main: 
    la $t7, a
    lw $t0, 0($t7)
    la $t7, b
    lw $t1, 0($t7)
    add $t2, $t0, $t1
    addi $t2, $t2, 3
    la $t7, c
    sw $t2, 0($t7)
    li $t4, 4
loop:
    lw $t2, 0($t7)
    beq $t2, $t4, fim_loop
    addi $t2, $t2, 1
    sw $t2, 0($t7)
    j loop
fim_loop:
    la $t7, resultado
    sw $t2, 0($t7)
