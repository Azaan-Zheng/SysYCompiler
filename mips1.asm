.data
    g0s0: .asciiz "20373184\n"
    g0s1: .asciiz "Wow, you will begin test your program!\n"
    g0s2: .asciiz "\n"
    g0s3: .asciiz "\n"
    g0s4: .asciiz "\n"
    g0s5: .asciiz "\n"
    g0s6: .asciiz "\n"
    g0s7: .asciiz "\n"
    g0s8: .asciiz "\n"
    g0s9: .asciiz "-"
    g0s10: .asciiz "\n"

.text

    addiu $sp, $sp, -8
    sw $ra, 0($sp)
    jal fmain
    lw $ra, 0($sp)
    li $v0, 10
    syscall

fmain:
    sw $ra, -4($sp)
    addiu $sp, $sp, -396

bmain_label0:
    li $t0, 1
    sw $t0, 388($sp)
    li $t1, -2
    sw $t1, 380($sp)
    li $t2, 3
    sw $t2, 372($sp)
    li $t3, 4
    sw $t3, 364($sp)
    li $t4, 5
    sw $t4, 356($sp)
    li $t5, 6
    sw $t5, 348($sp)
    li $t6, 111
    sw $t6, 340($sp)
    li $t7, 123
    li $t8, 234
    add $t9, $t7, $t8
    sw $t9, 332($sp)
    li $s0, 6
    li $s1, 5
    li $s2, 3
    add $s3, $s1, $s2
    mul $s4, $s0, $s3
    li $s5, 10
    sub $s6, $s4, $s5
    sw $s6, 316($sp)
    addiu $gp, $sp, 340
    lw $s7, 0($gp)
    addiu $k1, $sp, 332
    lw $k0, 0($k1)
    li $a1, 3
    mul $a2, $k0, $a1
    add $a3, $s7, $a2
    sw $a3, 284($sp)
    li $v0, 5
    syscall
    addiu $v1, $v0, 0
    sw $v1, 260($sp)
    sw $t0, 384($sp)
    li $v0, 5
    syscall
    addiu $t0, $v0, 0
    sw $t0, 256($sp)
    sw $t1, 376($sp)
    li $v0, 5
    syscall
    addiu $t1, $v0, 0
    sw $t1, 252($sp)
    sw $t2, 368($sp)
    li $v0, 5
    syscall
    addiu $t2, $v0, 0
    sw $t2, 248($sp)
    sw $t3, 360($sp)
    li $v0, 5
    syscall
    addiu $t3, $v0, 0
    sw $t3, 244($sp)
    sw $t4, 352($sp)
    li $v0, 5
    syscall
    addiu $t4, $v0, 0
    sw $t4, 240($sp)
    la $a0, g0s0
    li $v0, 4
    syscall
    la $a0, g0s1
    li $v0, 4
    syscall
    sw $t5, 344($sp)
    li $t5, 1
    sw $t6, 336($sp)
    li $t6, 2
    sw $t7, 328($sp)
    add $t7, $t5, $t6
    addiu $a0, $t7, 0
    li $v0, 1
    syscall
    la $a0, g0s2
    li $v0, 4
    syscall
    sw $t8, 324($sp)
    sw $t9, 320($sp)
    addiu $t9, $sp, 356
    lw $t8, 0($t9)
    sw $s0, 312($sp)
    sw $s1, 308($sp)
    addiu $s1, $sp, 348
    lw $s0, 0($s1)
    sw $s2, 304($sp)
    mul $s2, $t8, $s0
    addiu $a0, $s2, 0
    li $v0, 1
    syscall
    la $a0, g0s3
    li $v0, 4
    syscall
    sw $s3, 300($sp)
    sw $s4, 296($sp)
    addiu $s4, $sp, 388
    lw $s3, 0($s4)
    sw $s5, 292($sp)
    sw $s6, 288($sp)
    addiu $s6, $sp, 380
    lw $s5, 0($s6)
    sw $s7, 280($sp)
    add $s7, $s3, $s5
    sw $k0, 276($sp)
    addiu $k0, $sp, 372
    lw $gp, 0($k0)
    mul $k1, $s7, $gp
    sw $k1, 236($sp)
    sw $a1, 272($sp)
    sw $a2, 268($sp)
    addiu $a2, $sp, 332
    lw $a1, 0($a2)
    sw $a3, 264($sp)
    sw $v1, 204($sp)
    addiu $v1, $sp, 340
    lw $a3, 0($v1)
    sw $t0, 200($sp)
    rem $t0, $a1, $a3
    sw $t1, 196($sp)
    sw $t2, 192($sp)
    addiu $t2, $sp, 356
    lw $t1, 0($t2)
    sw $t3, 188($sp)
    add $t3, $t0, $t1
    sw $t3, 232($sp)
    sw $t4, 184($sp)
    sw $t5, 180($sp)
    addiu $t5, $sp, 284
    lw $t4, 0($t5)
    sw $t6, 176($sp)
    sw $t7, 172($sp)
    addiu $t7, $sp, 316
    lw $t6, 0($t7)
    sw $t8, 168($sp)
    mul $t8, $t4, $t6
    sw $s0, 164($sp)
    addiu $s0, $sp, 364
    lw $t9, 0($s0)
    sub $s1, $t8, $t9
    sw $s1, 228($sp)
    sw $s2, 160($sp)
    sw $s3, 156($sp)
    addiu $s3, $sp, 260
    lw $s2, 0($s3)
    li $s4, 2
    sw $s5, 152($sp)
    div $s5, $s2, $s4
    sw $s7, 148($sp)
    addiu $s7, $sp, 348
    lw $s6, 0($s7)
    sw $gp, 144($sp)
    mul $gp, $s5, $s6
    sw $gp, 224($sp)
    sw $k1, 140($sp)
    addiu $k1, $sp, 256
    lw $k0, 0($k1)
    sw $a1, 136($sp)
    li $a1, 1
    sw $a3, 132($sp)
    addiu $a3, $sp, 252
    lw $a2, 0($a3)
    add $v1, $a1, $a2
    sw $t0, 128($sp)
    mul $t0, $k0, $v1
    sw $t1, 124($sp)
    li $t1, 3
    rem $t2, $t0, $t1
    sw $t2, 220($sp)
    sw $t3, 120($sp)
    sw $t4, 116($sp)
    addiu $t4, $sp, 248
    lw $t3, 0($t4)
    sub $t5, $0, $t3
    sw $t5, 216($sp)
    sw $t6, 112($sp)
    li $t6, 6
    sw $t8, 108($sp)
    addiu $t8, $sp, 244
    lw $t7, 0($t8)
    sw $t9, 104($sp)
    add $t9, $t6, $t7
    sw $t9, 212($sp)
    sw $s1, 100($sp)
    addiu $s1, $sp, 236
    lw $s0, 0($s1)
    addiu $a0, $s0, 0
    li $v0, 1
    syscall
    la $a0, g0s4
    li $v0, 4
    syscall
    sw $s2, 96($sp)
    addiu $s3, $sp, 232
    lw $s2, 0($s3)
    addiu $a0, $s2, 0
    li $v0, 1
    syscall
    la $a0, g0s5
    li $v0, 4
    syscall
    sw $s4, 92($sp)
    sw $s5, 88($sp)
    addiu $s5, $sp, 228
    lw $s4, 0($s5)
    addiu $a0, $s4, 0
    li $v0, 1
    syscall
    la $a0, g0s6
    li $v0, 4
    syscall
    sw $s6, 84($sp)
    addiu $s7, $sp, 224
    lw $s6, 0($s7)
    addiu $a0, $s6, 0
    li $v0, 1
    syscall
    la $a0, g0s7
    li $v0, 4
    syscall
    sw $gp, 80($sp)
    sw $k0, 76($sp)
    addiu $k0, $sp, 220
    lw $gp, 0($k0)
    addiu $a0, $gp, 0
    li $v0, 1
    syscall
    la $a0, g0s8
    li $v0, 4
    syscall
    sw $a1, 72($sp)
    addiu $a1, $sp, 216
    lw $k1, 0($a1)
    sw $a2, 68($sp)
    addiu $a3, $sp, 212
    lw $a2, 0($a3)
    addiu $a0, $k1, 0
    li $v0, 1
    syscall
    la $a0, g0s9
    li $v0, 4
    syscall
    addiu $a0, $a2, 0
    li $v0, 1
    syscall
    la $a0, g0s10
    li $v0, 4
    syscall
    sw $v1, 64($sp)
    li $v1, 0
    addiu $v0, $v1, 0
    lw $ra, 392($sp)
    addiu $sp, $sp, 396
    jr $ra
