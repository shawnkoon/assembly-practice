# This program recursivly reverse characters in the str.

.data
    str: .asciiz "abcdefg"

.text
main:
    addi $sp, $sp, -4
    la $t1, str
    sw $t1, 0($sp)
    jal rpint
    addi $sp, $sp, 4
    addi $v0, $0, 10
    syscall

rpint:
    lw $t0, 0($sp)
    lb $t2, 0($t0)
    bne $t2, 0, dor
    jr $ra

dor:
    addi $sp, $sp, -4
    sw $t0, 0($sp)           # received address -> stack

    addi $t0, $t0, 1         # pointer = received address + 1

    addi $sp, $sp, -4
    sw $ra, 0($sp)

    addi $sp, $sp, -4
    sw $t0, 0($sp)           # pointer -> stack, call

    jal rpint

    lw $t3, 8($sp)
    lb $a0, 0($t3)
    addi $v0, $0, 11
    syscall

    lw $ra, 4($sp)
    addi $sp, $sp, 12
    jr $ra
