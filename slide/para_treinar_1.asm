.text
.global main
main:
	beq $t1, 0, SE
	sub $t0, $t0, $t1
	addi $t0, $t0, 1
	j FIM
SE:
	add $t0, $t0, $t1
	addi $t0, $t0, -1
	j FIM
FIM:
	li $v0, 10
	syscall