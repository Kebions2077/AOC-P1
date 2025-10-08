		    .data:
	a:.word 1	  #int a 
	b:.word 1	  #int b
	c:.word 0	  #int c, variavel para armazenar c=a+b
	x:.word 0	  #int x, variavel para rodar o loop 
	resultado:	  .word 0 #resultado final apos todas as operaçoes 

		    .text:
	
	main:

	
	lw $t0,a	  #puxa "a" da memoria e coloca em t0
	
	lw $t1,b 	  #puxa "b" da memoria e coloca em t1
	
	add $t2,$t0,$t1		 #c=a+b e coloca em t2
	
	sw $t2, c		#salva o resultado de a+b na variavel c
	
	addi $t3,$t2,3 		 #realiza uma soma com o c e com o imediato 3 e coloca em t3
	
		
	loop:
	
	 lw      $t2, c        # Carrega o valor de c em $t2

        # Verifica se c == 8
        li      $t4, 8        # Carrega o valor 8 em $t4
        beq     $t2, $t4, fim_loop # Se c == 8, vai para fim_loop

        # Incrementa c em 1
        addi    $t2, $t2, 1
        sw      $t2, c        # Armazena o novo valor de c na memória

        # Volta para o início do loop
        j       loop          # Desvia incondicionalmente para o início do loop

    fim_loop:
        # Armazena o resultado final
        sw      $t2, resultado # Armazena o valor de c no resultado

        # Termina o programa
        li      $v0, 10       # Código para terminar o programa
        syscall               
	

	
	
	
	
	




