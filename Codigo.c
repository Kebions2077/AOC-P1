#include <stdio.h>

int main() {
    // Variáveis inicializadas com 0
    int a = 0;
    int b = 0;
    int c = 0;
    int resultado = 0;
    
    // Somar os valores de 'a' e 'b' e armazenar em 'c'
    c = a + b;  // Equivalente ao: add $t2, $t0, $t1
    
    // Loop para incrementar 'c' de 0 até 6
    while (c < 6) {
        c = c + 1;  // Equivalente ao: addi $t2, $t2, 1
    }
    
    // Armazenar o valor final na variável 'resultado'
    resultado = c;
    
    printf("Valor final de resultado: %d\n", resultado);
    
    return 0;
}
