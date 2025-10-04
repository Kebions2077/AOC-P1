        .data
        # Não há dados inicializados na seção .data

        .text
        .globl main
main:
        # Prologo
        addiu   $sp, $sp, -32    # Alocar espaço na pilha
        sw      $fp, 28($sp)     # Salvar o frame pointer anterior
        sw      $ra, 24($sp)     # Salvar o endereço de retorno
        move    $fp, $sp         # Atualizar o frame pointer

        # Inicialização das variáveis
        li      $s0, 1           # a = 1
        li      $s1, 1           # b = 1

        # c = a + b
        add     $s2, $s0, $s1    # c = a + b

        # c = c + 3
        addi    $s2, $s2, 3      # c = c + 3

        # Inicialização do loop
        li      $s3, 0           # x = 0

loop_start:
        slti    $t0, $s3, 10     # $t0 = (x < 10) ? 1 : 0
        beq     $t0, $zero, loop_end  # Se x >= 10, sair do loop

        # c++
        addi    $s2, $s2, 1      # c = c + 1

        # x++
        addi    $s3, $s3, 1      # x = x + 1

        j       loop_start       # Voltar ao início do loop

loop_end:
        # Epílogo
        move    $sp, $fp         # Restaurar o stack pointer
        lw      $ra, 24($sp)     # Restaurar o endereço de retorno
        lw      $fp, 28($sp)     # Restaurar o frame pointer
        addiu   $sp, $sp, 32     # Liberar espaço na pilha
        jr      $ra              # Retornar da função

        .end main
