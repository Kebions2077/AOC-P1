.data
a:      .word   1               # int a = 1
b:      .word   1               # int b = 1
c:      .word   0               # int c = 0
x:      .word   0               # int x = 0

.text

main:
    # c = a + b (R-type)
    lw      $t0, a($zero)     # Carrega a
    lw      $t1, b($zero)     # Carrega b
    add     $t2, $t0, $t1     # c = a + b

    # c = c + 3 (Imediato)
    sw      $t2, c($zero)     # Armazena c
    lw      $t2, c($zero)     # Carrega c
    addi    $t2, $t2, 3       # c += 3
    sw      $t2, c($zero)     # Armazena c

    # x = 0
    sw      $zero, x($zero)   # x = 0

loop:
    # Loop sem 'j'
    # c++ (SW)
    lw      $t2, c($zero)     # Carrega c
    addi    $t2, $t2, 1       # c++
    sw      $t2, c($zero)     # Armazena c

    # x++ (SW)
    lw      $t3, x($zero)     # Carrega x
    addi    $t3, $t3, 1       # x++
    sw      $t3, x($zero)     # Armazena x

    # Condição do loop (x < 8)
    lw      $t3, x($zero)     # Carrega x para comparação
    slti    $t4, $t3, 8       # $t4 = (x < 8) ? 1 : 0
    bne     $t4, $zero, loop  # Branch se verdadeiro
    nop

    # Armazena o valor final de 'c' em $t3
    lw      $t3, c($zero)     # Carrega o valor final de 'c' em $t3

    # Retorno (mantido apenas para completude)
    jr      $ra
    nop
