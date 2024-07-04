.data
   original_file: .asciiz "/home/m/mtsmoh010/Documents/Arch_Assignment2/house_64_in_ascii_lf.ppm"
   output_file:     .asciiz  "/home/m/mtsmoh010/Documents/Arch_Assignment2/increase_output.txt"
   sum_of_pixels:    .word   0    
   buffer:  .space 50000
   newline: .asciiz "\n"
   modified_sum_value:    .word   0    
   string_new: .asciiz  "\nvalue_averaged pixel value of new image:\n"  
   string_conversion: .asciiz "value_averaged pixel value of the original image:\n"     
   output_buffer: .space 50000
   headerlook:   .space 19
   number:  .space 10
   number_integer:  .space 10
   
.text
.globl main

main:
	move $t3, $zero
	move $t9, $zero  
   la $s2, number 
   la $s3, output_buffer
   la $s4, headerlook
   move $t1, $zero

   li $v0, 13
   la $a0, original_file
   li $a1, 0
   li $a2, 0
   syscall

   move $s0, $v0

   li $v0, 14
   move $a0, $s0
   la $a1, headerlook
   li $a2, 19
   syscall

   li $v0, 14
   move $a0, $s0
   la $a1, buffer
   li $a2, 50000
   syscall


   li $v0, 16
   move $a0, $s0
   syscall

   lb $t7, 0($a1)
  
   
   move $t0, $a1  
   move $t4, $zero  

   first_loop:
      lb $t7, 0($t0)
      beqz $t7, file_close    
      beq $t7, 10, change 
      sb $t7, 0($s2)
      addi $t0, $t0, 1
      addi $s2, $s2, 1
      addi $t4, $t4, 1
      j first_loop

value_averaged:

    li $t0, 765         
    li $t1, 4096        
    

    mul $t2, $t1, $t0

    lw $t7,  sum_of_pixels
    mtc1 $t7, $f0
    cvt.d.w $f0, $f0

    lw $t4, modified_sum_value
    mtc1 $t4, $f2
    cvt.d.w $f2, $f2

    mtc1 $t2, $f4
    cvt.d.w $f4, $f4

    div.d $f6, $f0, $f4

    div.d $f8, $f2, $f4
	
	jr $ra

change:
   li $t6, 0
   sub $s2, $s2, $t4
   move $t8, $zero

   second_loop:
      lb $t3, 0($s2)
      beq $t8, $t4, exit_loop
      mul $t6, $t6, 10
      sub $t3, $t3, '0'
      add $t6, $t6, $t3 
      addi $s2, $s2, 1
      addi $t8, $t8, 1
      j second_loop

   exit_loop:
      addi $t0, $t0, 1
      sub $s2, $s2, $t4
	   lw $t3, sum_of_pixels
	   add $t3, $t3, $t6   

      sw $t3, sum_of_pixels
      bgt $t6, 245, maximum_value
      add $t6, $t6, 10
      bgt $t6, 100, counter1
      blt $t6, 100, counter2

      counter1:
         blt $t6, 110, double_digits

         counter2:
            add $s0, $t4, $zero
            sub $t4, $t4, 1
            add $s3, $s3, $t4
            move $t4, $zero
            move $t5, $zero

            interger_conversion:
               lw $t9, modified_sum_value
			      add $t9, $t9, $t6   
			      sw $t9, modified_sum_value      

               div $t6, $t6, 10
               mfhi $t3
               beq $t5, $s0, new_line
               add $t3, $t3, '0'
               sb $t3, 0($s3)
               addi $s3, $s3, -1
               addi $t5, $t5, 1
               j interger_conversion

new_line:
   addi $t5, $t5, 1
   add $s3, $s3, $t5
   addi $t9, $zero, 0xA
   sb $t9, 0($s3)
   addi $s3, $s3, 1
   j first_loop

maximum_value:
   li $t6, 255
   add $t2, $t2, $t6
   add $s0, $t4, $zero
   sub $t4, $t4, 1
   add $s3, $s3, $t4
   move $t4, $zero
   move $t5, $zero
   j interger_conversion

double_digits:
	
   addi $t4, $t4, 1
   add $s0, $t4, $zero
   sub $t4, $t4, 1
   add $s3, $s3, $t4
   move $t4, $zero
   move $t5, $zero
   j interger_conversion


file_close:
   li   $v0, 13
   la   $a0, output_file
   li   $a1, 1
   syscall
   move $s6, $v0

   li   $v0, 15
   move $a0, $s6
   la   $a1, headerlook
   li   $a2, 19
   syscall
   
   li   $v0, 15
   move $a0, $s6
   la   $a1, output_buffer
   li   $a2, 50000
   syscall
   
   jal value_averaged

    jal value_averaged
   
    li $v0, 4
    la $a0, string_conversion
    syscall

 
    li $v0, 3  
    mov.d $f12, $f6  
    syscall


    li $v0, 4
    la $a0, string_new
    syscall


    li $v0, 3 
    mov.d $f12, $f8 
    syscall
   

   li   $v0, 16
   move $a0, $s6
   syscall

   li $v0, 10
   syscall