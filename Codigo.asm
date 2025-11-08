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
    add $t2, $t0, $t1           # instrução aritmética entre registradores
    la $t7, c
    sw $t2, 0($t7)
    addi $t3, $t2, 3            # instrução aritmética com imediato

    # Inicializa c com 5 (sem alterar o .data)
    li $t2, 5
    la $t7, c
    sw $t2, 0($t7)

loop:
    la $t7, c
    lw $t2, 0($t7)              # load
    li $t4, 6
    beq $t2, $t4, fim_loop      # branch condicional: não tomado 1ª vez, tomado 2ª
    addi $t2, $t2, 1
    sw $t2, 0($t7)              # store
    j loop

fim_loop:
    la $t7, resultado
    sw $t2, 0($t7)
    li $v0, 10
    syscall
