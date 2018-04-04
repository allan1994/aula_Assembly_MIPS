.data
str1:	.asciiz "Enter a value:"
str2:	.asciiz "Tun dum tizz:"
.text
.globl main

main:
	#Imprimir str2
	li $v0, 4
	la $a0, str2
	syscall #permite comunicação com o sistema host

	#Ler o valor
	li $v0, 5 #5 = Ler uma um inteiro
	syscall
	move $t0, $v0
	
	li, $t1, 100
	sw $t1, ($gp)

	#Imprimir str1
	li $v0, 4
	la $a0, str1
	syscall

	#Ler o outro valor
	li $v0, 5
	syscall
	move $t1, $v0
	

	#soma os valores
	add $t0, $t1, $t0
	
	#Imprimir str2
	li $v0, 4
	la $a0, str2
	syscall
	
	#Imprimir o int(resultado)
	li $v0, 1
	move $a0, $t0
	syscall
	
