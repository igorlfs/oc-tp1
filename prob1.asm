.data
vetor: .word 1 2 3 4 5 6 7
.text
main:
la x12, vetor
addi x13, x0, 7
addi x13, x13, -1
slli x13, x13, 2
add x13, x13, x12
jal x1, inverte
beq x0, x0, FIM
##### START MODIFIQUE AQUI START #####
inverte:
# Carregar valor (a) de vetor[0+i] em uma variável temporária
lw x10, 0(x12)
# Carregar valor (b) de vetor[n-i] em outra variável temporária
lw x11, 0(x13)
# Escrever "a" na posição vetor[n-i]
sw x11, 0(x12)
# Escrever "b" na posição vetor[0+i]
sw x10, 0(x13)
# Confere se trocou mesmo
lw x10, 0(x12)
lw x11, 0(x13)
# Incrementar i (min)
addi x12, x12, 4
# Decrementar max
addi x13, x13, -4
# Checar se cruzou
bge x13, x12, OUT
jalr x0, 0(x1)
OUT:
jal x1, inverte
##### END MODIFIQUE AQUI END #####
FIM: add x1, x0, x10
