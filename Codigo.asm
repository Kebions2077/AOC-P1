        .data
a:      .word   1               # int a = 1
b:      .word   1               # int b = 1
c:      .word   0               # int c = 0
x:      .word   0               # int x = 0

        .text
        .globl  main
main:
        # c = a + b (R-type)
        lw      $t0, a($zero)     # LW: Carrega a
        lw      $t1, b($zero)     # LW: Carrega b
        add     $t2, $t0, $t1     # R-type: c = a + b

        # c = c + 3 (Imediato)
        sw      $t2, c($zero)     # SW: Armazena c
        lw      $t2, c($zero)     # LW: Carrega c
        addi    $t2, $t2, 3       # Imediato: c += 3
        sw      $t2, c($zero)     # SW: Armazena c

        # x = 0
        sw      $zero, x($zero)   # SW: x = 0

loop:   # Loop sem 'j'
        # c++ (SW)
        lw      $t2, c($zero)     # LW: Carrega c
        addi    $t2, $t2, 1       # Imediato: c++
        sw      $t2, c($zero)     # SW: Armazena c

        # x++ (SW)
        lw      $t3, x($zero)     # LW: Carrega x
        addi    $t3, $t3, 1       # Imediato: x++
        sw      $t3, x($zero)     # SW: Armazena x

        # Condição do loop (x < 10)
        lw      $t3, x($zero)     # LW: Carrega x para comparação
        slti    $t4, $t3, 8      # $t4 = (x < 8) ? 1 : 0
        bne     $t4, $zero, loop  # Branch se verdadeiro (sem 'j'/'jr')
        nop

        # Retorno (mantido apenas para completude)
        jr      $ra
        nop
