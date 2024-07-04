.data
original_file: .asciiz "/home/m/mtsmoh010/Documents/house_64_in_ascii_lf.ppm" 
modified_file: .asciiz "/home/m/mtsmoh010/Documents/grey_output.txt"    
newline: .asciiz "\n"
header_descriptor: .asciiz "2"
input_buffer: .space 60000
buffer_out: .space 13000

.text
.globl main

main:

    li $v0 13
    la $a0, original_file
    li $a1, 0
    syscall
    move $t0, $v0

    li $v0 14
    move $a0, $t0
    la $a1, input_buffer
    li $a2, 60000
    syscall

    li $v0 16
    move $a0, $t0
    syscall

    la $t1, input_buffer
    la $t2, buffer_out
    la $t3, newline
    la $t4, header_descriptor

    move $t5, $zero
    move $t6, $zero
    move $t7, $zero
    move $t8, $zero

    li $t9, 10
    li $s0, 100

    j read_title

read_title:

    beq $t6, 19, pixel_processing_loop

    lb $t0, ($t1)
    beq $t6, 1, heading_modified
    sb $t0, ($t2)

    addi $t1, $t1, 1
    addi $t2, $t2, 1
    addi $t6, $t6, 1
    j read_title

heading_modified:

    lb $t0, ($t4)
    sb $t0, ($t2)

    addi $t1, $t1, 1
    addi $t2, $t2, 1
    addi $t6, $t6, 1
    j read_title

pixel_processing_loop:

    lb $t0, ($t1)

    beq $t0, 0, write_output
    beq $t0, 10, integer_conv

    addi $t0, $t0, -48
    mul $t7, $t7, $t9
    add $t7, $t7, $t0
    addi $t1, $t1, 1
    j pixel_processing_loop

integer_conv:

    add $t8, $t8, $t7
    addi $t5, $t5, 1
    beq $t5, 3, average_value
    move $t7, $zero
    addi $t1, $t1, 1
    j pixel_processing_loop

average_value:

    li $s1, 3
    div $t8, $s1
    mflo $t8
    bgt $t8, 255, maximum_val
    j string_conversion

maximum_val:

    li $t8, 255
    j string_conversion

corrected:

    addi $t6, $t6, 1
    addi $t2, $t2, 1
    lb $t8, ($t3)
    sb $t8, ($t2)

    addi $t2, $t2, 1
    addi $t1, $t1, 1

    move $t5, $zero
    move $t7, $zero
    move $t8, $zero
    j pixel_processing_loop

string_conversion:

    blt $t8, 100, double_digit

    div $t8, $s0
    mflo $t8
    addi $t8, $t8, 48
    sb $t8, ($t2)

    addi $t2, $t2, 1
    mfhi $t8
    div $t8, $t9
    mflo $t8
    addi $t8, $t8, 48
    sb $t8, ($t2)

    addi $t2, $t2, 1
    mfhi $t8
    addi $t8, $t8, 48
    sb $t8, ($t2)

    addi $t6, $t6, 3

    j corrected

double_digit:

    div $t8, $t9
    mflo $t8
    addi $t8, $t8, 48
    sb $t8, ($t2)

    addi $t2, $t2, 1
    mfhi $t8
    addi $t8, $t8, 48
    sb $t8, ($t2)

    addi $t6, $t6, 2

    j corrected 

write_output:

    addi $t6, $t6, -19

    li $v0 4
    la $a0, buffer_out
    syscall

    li $v0 13
    la $a0, modified_file
    li $a1, 1
    li $a2, 0
    syscall
    move $s2, $v0

    li $v0 15
    move $a0, $s2
    la $a1, buffer_out
    move $a2, $t6
    syscall

    li $v0 16
    move $a0, $s2
    syscall

    j exit

exit:

    li $v0 10
    syscall
