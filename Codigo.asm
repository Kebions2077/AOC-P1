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
	
	lw $s0, x
	

	
	
	
	
	



