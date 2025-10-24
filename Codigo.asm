# Seção de dados - declaração de variáveis
.data
a: .word 0          # Variável 'a' - valor inicial 0
b: .word 0          # Variável 'b' - valor inicial 0
c: .word 0          # Variável 'c' - valor inicial 0
x: .word 0          # Variável 'x' - valor inicial 0 (não usada)
resultado: .word 0  # Variável 'resultado' - valor inicial 0

# Seção de código - programa principal
.text
main: 
    # Carregar valor de 'a' no registrador $t0
    la $t7, a          # $t7 = endereço de 'a'
    lw $t0, 0($t7)     # $t0 = valor almacenado no endereço de 'a' ($t0 = 0)
    
    # Carregar valor de 'b' no registrador $t1
    la $t7, b          # $t7 = endereço de 'b'
    lw $t1, 0($t7)     # $t1 = valor almacenado no endereço de 'b' ($t1 = 0)
    
    add $t2, $t0, $t1  # REQUISITO 1: Instrução aritmética usando apenas registradores
    
    # Armazenar o resultado da soma em 'c' (instrução STORE)
    la $t7, c          # $t7 = endereço de 'c'
    sw $t2, 0($t7)     # Armazena $t2 na memória no endereço de 'c' (c = 0)
    
    # Instrução aritmética com operando imediato (não utilizada posteriormente)
    addi $t3, $t2, 3   # REQUISITO 2: Instrução aritmética com operando imediato

# Loop para incrementar 'c' de 0 até 6
loop:
    # Carregar valor atual de 'c' (instrução LOAD)
    la $t7, c          # $t7 = endereço de 'c'
    lw $t2, 0($t7)     # REQUISITO 3: Instrução LOAD
    
    # Carregar valor imediato 6 no registrador $t4
    li $t4, 6          # $t4 = 6 (valor de comparação para o loop)
    
    # Branch condicional: verifica se $t2 == $t4
    beq $t2, $4, fim_loop  # REQUISITO 4: Branch condicional (tomado quando $t2==6, não tomado quando $t2<6)
    
    # Incrementar o valor de 'c' (instrução aritmética com operando imediato)
    addi $t2, $t2, 1   # $t2 = $t2 + 1 (incrementa contador)
    
    # Armazenar o valor incrementado de volta em 'c' (instrução STORE)
    sw $t2, 0($t7)     # REQUISITO 3: Instrução STORE
    
    # Salto incondicional de volta ao início do loop
    j loop             # Volta para o rótulo 'loop'

fim_loop:
    # Armazenar o valor final (6) na variável 'resultado'
    la $t7, resultado  # $t7 = endereço de 'resultado'
    sw $t2, 0($t7)     # Armazena $t2 (valor 6) na variável 'resultado'
    
    # Terminar o programa (syscall de exit)
    li $v0, 10         # $v0 = 10 (código do syscall para terminar programa)
    syscall            # Executa syscall para sair do programa

# REQUISITO 5: Hazard de dados presente entre "lw $t0, 0($t7)" e "add $t2, $t0, $t1"
# A instrução ADD depende do resultado do LOAD anterior, causando hazard de dados
