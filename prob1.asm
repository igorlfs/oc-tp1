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
	# empilha
    addi sp,sp,-12
    
    # salva
    sw x1,8(sp)
    sw x12, 4(sp)
    sw x13, 0(sp)
    
    # checa
    bge x13,x12,L1
    
    # desempilha
    addi sp,sp,12
    
    # retorna
    jalr x0,0(x1)

L1: 
    
    # itera
    addi x12,x12,4
    addi x13,x13,-4
    
    # recursa
    jal x1, inverte
    
	# carrega endereços
	lw x10, 0(sp)
    lw x11, 4(sp)
    lw x1, 8(sp)
    
    # carrega valores
    lw x5, 0(x10)
    lw x6, 0(x11)
    
    # escreve valores
    sw x5, 0(x11)
    sw x6, 0(x10)
    
    # desempilha
    addi sp, sp, 12
    
    # retorna
    jalr x0, 0(x1)
##### END MODIFIQUE AQUI END #####
FIM: add x1, x0, x10
