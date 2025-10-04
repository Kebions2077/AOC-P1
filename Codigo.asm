        .text
        .globl main
main:
        # Prologue (configuração da pilha)
        addiu   $sp, $sp, -32
        sw      $fp, 28($sp)
        move    $fp, $sp

        # Inicialização das variáveis na memória
        li      $2, 1                # Carrega 1 em $2
        sw      $2, 16($fp)          # a = 1 (memória: offset 16)
        sw      $2, 20($fp)          # b = 1 (memória: offset 20)

        # c = a + b (R-type)
        lw      $3, 16($fp)          # Carrega a em $3
        lw      $2, 20($fp)          # Carrega b em $2
        nop                           # Hazard de dados: espera carregamento
        addu    $2, $3, $2           # $2 = a + b (R-type)
        sw      $2, 12($fp)          # Armazena c (offset 12)

        # c = c + 3 (Imediato)
        lw      $2, 12($fp)          # Carrega c
        nop                           # Hazard de dados
        addiu   $2, $2, 3            # $2 = c + 3 (Imediato)
        sw      $2, 12($fp)          # Armazena c

        # Inicializa x = 0 (memória: offset 8)
        sw      $0, 8($fp)           # x = 0

loop:   # Loop sem 'j'
        # c++ (memória -> registrador -> memória)
        lw      $2, 12($fp)          # Carrega c
        nop
        addiu   $2, $2, 1            # Incrementa c
        sw      $2, 12($fp)          # Armazena c

        # x++ (memória -> registrador -> memória)
        lw      $2, 8($fp)           # Carrega x
        nop
        addiu   $2, $2, 1            # Incrementa x
        sw      $2, 8($fp)           # Armazena x

        # Condição do loop (x < 10)
        lw      $2, 8($fp)           # Carrega x
        nop
        slti    $2, $2, 10           # $2 = (x < 10) ? 1 : 0
        bne     $2, $0, loop         # Branch se verdadeiro (sem 'j')
        nop

        # Epílogo (retorno)
        move    $2, $0               # return 0
        move    $sp, $fp
        lw      $fp, 28($sp)
        addiu   $sp, $sp, 32
        jr      $ra
        nop
