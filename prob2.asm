.data
vetor: .word 1 1 4 4 4 7 7 7 0 0 0 1 6 1
.text
main:
la x12, vetor
addi x13, x0, 11
jal x1, verificacnpj
beq x0,x0,FIM
##### START MODIFIQUE AQUI START #####
verificacpf: 

### Primeiro dígito
addi x9, x0, 0
addi x8, x0, 9

LOOP:
beq x9, x8, OUT_SUM
	# Multiplica por 4
    slli x7, x9, 2
    # Calcula endereço de fonte
    add x7, x7, x12
    # Carrega dígito
    lw x10 0(x7)
    # Calcula multiplicador
    addi x6, x0, 10
    sub x6, x6, x9
    # Multiplica e joga no acumulador
    mul x10, x10, x6
	add x14, x10, x14
    # Incrementa iterador
    addi x9, x9, 1
    # Repete
    beq x0, x0, LOOP
OUT_SUM:

# Multiplica por 10
addi x6, x0, 10
mul x14, x14, x6
# Pega o resto na divisão por 11
addi x6, x6, 1
rem x14, x14, x6

# Se o resto da divisão for igual a 10, nós o consideramos como 0
addi x6, x0, 10
bne x14, x6, NOT_TEN
	addi x14, x0, 0
NOT_TEN:



### Primeiro dígito
addi x9, x0, 0
addi x8, x0, 10

LOOP_2:
beq x9, x8, OUT_SUM_2
	# Multiplica por 4
    slli x7, x9, 2
    # Calcula endereço de fonte
    add x7, x7, x12
    # Carrega dígito
    lw x10 0(x7)
    # Calcula multiplicador
    addi x6, x0, 11
    sub x6, x6, x9
    # Multiplica e joga no acumulador
    mul x10, x10, x6
	add x15, x10, x15
    # Incrementa iterador
    addi x9, x9, 1
    # Repete
    beq x0, x0, LOOP_2
OUT_SUM_2:

# Multiplica por 10
addi x6, x0, 10
mul x15, x15, x6
# Pega o resto na divisão por 11
addi x6, x6, 1
rem x15, x15, x6

# Se o resto da divisão for igual a 10, nós o consideramos como 0.
addi x6, x0, 10
bne x15, x6, NOT_TEN_2
	addi x15, x0, 0
NOT_TEN_2:

# Confere a validade dos dígitos
addi x10, x0, 0
lw x11, 36(x12)
bne x14, x11, INVALID
	lw x11, 40(x12)
	bne x15, x11, INVALID
    	addi x10, x10, 1
INVALID:

jalr x0, 0(x1)

verificacnpj:

### Primeiro dígito
# 5,4,3,2,9,8,7,6,5,4,3,2 
# 1
lw x10, 0(x12)
addi x11, x0, 5
mul x10, x10, x11
add x14, x10, x14
# 2
lw x10, 4(x12)
addi x11, x0, 4
mul x10, x10, x11
add x14, x10, x14
# 3
lw x10, 8(x12)
addi x11, x0, 3
mul x10, x10, x11
add x14, x10, x14
# 4
lw x10, 12(x12)
addi x11, x0, 2
mul x10, x10, x11
add x14, x10, x14
# 5
lw x10, 16(x12)
addi x11, x0, 9
mul x10, x10, x11
add x14, x10, x14
# 6
lw x10, 20(x12)
addi x11, x0, 8
mul x10, x10, x11
add x14, x10, x14
# 7
lw x10, 24(x12)
addi x11, x0, 7
mul x10, x10, x11
add x14, x10, x14
# 8
lw x10, 28(x12)
addi x11, x0, 6
mul x10, x10, x11
add x14, x10, x14
# 9
lw x10, 32(x12)
addi x11, x0, 5
mul x10, x10, x11
add x14, x10, x14
# 10
lw x10, 36(x12)
addi x11, x0, 4
mul x10, x10, x11
add x14, x10, x14
# 11
lw x10, 40(x12)
addi x11, x0, 3
mul x10, x10, x11
add x14, x10, x14
# 12 
lw x10, 44(x12)
addi x11, x0, 2
mul x10, x10, x11
add x14, x10, x14

# Módulo por 11
addi x6, x0, 11
rem x14, x14, x6
addi x11, x0, 2
bge x14, x11, BIG
	# Caso o resto da divisão seja menor que 2, o nosso primeiro dígito verificador se torna 0 
	addi x14, x0, 0
    beq x0, x0, JUMP
BIG:
	addi x6, x0, 11
    addi x11, x0, -1
    mul x14, x14, x11
	add x14, x14, x6
JUMP:



### Segundo dígito
# 6,5,4,3,2,9,8,7,6,5,4,3,2
# 1
lw x10, 0(x12)
addi x11, x0, 6
mul x10, x10, x11
add x15, x10, x15
# 2
lw x10, 4(x12)
addi x11, x0, 5
mul x10, x10, x11
add x15, x10, x15
# 3
lw x10, 8(x12)
addi x11, x0, 4
mul x10, x10, x11
add x15, x10, x15
# 4
lw x10, 12(x12)
addi x11, x0, 3
mul x10, x10, x11
add x15, x10, x15
# 5
lw x10, 16(x12)
addi x11, x0, 2
mul x10, x10, x11
add x15, x10, x15
# 6
lw x10, 20(x12)
addi x11, x0, 9
mul x10, x10, x11
add x15, x10, x15
# 7
lw x10, 24(x12)
addi x11, x0, 8
mul x10, x10, x11
add x15, x10, x15
# 8
lw x10, 28(x12)
addi x11, x0, 7
mul x10, x10, x11
add x15, x10, x15
# 9
lw x10, 32(x12)
addi x11, x0, 6
mul x10, x10, x11
add x15, x10, x15
# 10
lw x10, 36(x12)
addi x11, x0, 5
mul x10, x10, x11
add x15, x10, x15
# 11
lw x10, 40(x12)
addi x11, x0, 4
mul x10, x10, x11
add x15, x10, x15
# 12 
lw x10, 44(x12)
addi x11, x0, 3
mul x10, x10, x11
add x15, x10, x15
# 13
lw x10, 48(x12)
addi x11, x0, 2
mul x10, x10, x11
add x15, x10, x15

# Módulo por 11
addi x6, x0, 11
rem x15, x15, x6
addi x11, x0, 2
bge x15, x11, BIG_2
	# Caso o resto da divisão seja menor que 2, o nosso primeiro dígito verificador se torna 0 
 	addi x15, x0, 0
    beq x0, x0, JUMP_2
BIG_2:
	addi x6, x0, 11
    addi x11, x0, -1
    mul x15, x15, x11
	add x15, x15, x6
JUMP_2:

# Confere a validade dos dígitos
addi x10, x0, 0
lw x11, 48(x12)
bne x14, x11, INVALID_2
	lw x11, 52(x12)
	bne x15, x11, INVALID_2
    	addi x10, x10, 1
INVALID_2:

jalr x0, 0(x1)

verificadastro: jalr x0, 0(x1)
##### END MODIFIQUE AQUI END #####
FIM: add x1, x0, x10
