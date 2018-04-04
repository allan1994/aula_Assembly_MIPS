.data
	# int k, f, g=5, h=7, i=56, j=9;
	k: .word 0
	f_1: .word 0
	g: .word 5
	h: .word 7
	i: .word 56
	j_1: .word 9
	
	printf: .asciiz "Digite o valor de k"
.text
	
.globl main

main:
	#Imprimir printf - printf(“Digite o valor de k\n”);
	li $v0, 4 #4 = Imprime na tela
	la $a0, printf
	syscall
	
	#Ler o valor - scanf(“%d”, &k);
	li $v0, 5 #5 = Ler uma integer
	syscall
	sw $v0, k
	
	# Switch case com o k
	la $t1, k
	beq $t1, 0, caso_0
	beq $t1, 1, caso_1
	beq $t1, 2, caso_2
	beq $t1, 3, caso_3
	
caso_0:
	la $t0, f_1
	la $t1, i
	la $t2, j_1
	add $t0, $t1, $t2 # case 0: f = i + j; break;
	sw $t0, f_1
	sw $t1, i
	sw $t2, j_1
	j fim
caso_1:
	la $t0, f_1
	la $t1, g
	la $t2, h
	add $t0, $t1, $t2
	sw $t0, f_1
	sw $t1, g
	sw $t2, h
	j fim
caso_2:
	sub f_1, g, h
	j fim
caso_3:
	sub f_1, i, h
	j fim
fim:
	li $v0, 4 #4 = Imprime na tela
	la $a0, f_1
	syscall
	
	li $v0, 10
	syscall	