.data
vetor: .word 5 2 9 9 8 2 2 4 7 2 5
.text
main:
la x12, vetor
addi x13, x0, 11
jal x1, verificacpf
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

verificacnpj: jalr x0, 0(x1)
verificadastro: jalr x0, 0(x1)
##### END MODIFIQUE AQUI END #####
FIM: add x1, x0, x10
