.data 
num: .word 8
.text 
lw t0, num
addi t0, t0, 10
sw t0, num, t2
#sw ra, 0(sp)