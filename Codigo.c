#include <stdio.h>

int main() {
    int a = 0;
    int b = 0;
    int c = 0;
    int x = 0;
    int resultado = 0;

    // --- Parte inicial (equivalente às instruções antes do loop) ---
    int t0 = a;
    int t1 = b;
    int t2 = t0 + t1;    // add $t2, $t0, $t1  -> operação entre registradores
    c = t2;
    int t3 = t2 + 3;     // addi $t3, $t2, 3   -> operação com imediato

    // Inicializa c com 5 (sem alterar .data no MIPS)
    t2 = 5;
    c = t2;

    // --- Loop ---
    int t4 = 6;
    while (1) {
        t2 = c;
        if (t2 == t4)     // beq $t2, $t4, fim_loop
            break;        // branch tomado (fim_loop)
        t2 = t2 + 1;      // addi $t2, $t2, 1
        c = t2;           // sw $t2, 0($t7)
    }

    // --- Fim do loop ---
    resultado = t2;

    return 0;
}
