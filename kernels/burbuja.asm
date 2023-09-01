.data 
array:  .word 5, 2, 9, 1, 5, 6, 3, 8, 7, 4
n:      .word 10

.text 
auipc a0,2
add a4, zero, a0
add t0,zero,zero
add t3,zero,zero
lw t1,n
addi t1, t1,-1

dowhile02:
dowhile01:

lw a1,0(a0)
lw a2,4(a0)
bge a1,a2, Mayor_o_igual
#menor
sw a1,4(a0)
sw a2,0(a0)
Mayor_o_igual:
addi a0,a0,4

addi t0, t0,1
blt t0,t1, dowhile01
add a0,zero,a4
add t0, zero,zero
addi t3,t3,1
blt t3,t1, dowhile02


