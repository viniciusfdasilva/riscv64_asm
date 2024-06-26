# THIS ASSEMBLY FILE CONTAINS THE CALCULATOR'S CODE OF TWO NUMBERS

		.section .rodata

prompt_msg:  .string "Calculator:\n Type [+]: SUM\n Type [-]: SUB\n Type [*]: MUL\n"
prompt_size: .byte .-prompt_msg

first_number:    .string "Type the first number:\n"
second_number:   .string "Type the second number:\n"

second_number_size: .byte .-second_number
first_number_size:  .byte .-first_number

buffer_size:               .byte .-buffer
buffer_first_number_size:  .byte .-buffer_first_number
buffer_second_number_size: .byte .-buffer_second_number_size


		.section .bss

buffer:	              .space 255
buffer_first_number:  .space 255
buffer_second_number: .space 255

		.section .text
		.global _start

_start:
	la  a1, prompt_msg
	lbu a2, prompt_size

	call prompt
	
	la  a1, buffer
	lbu a2, buffer_size

	call read
	
	la  a1, first_number
	lbu a2, first_number_size
	
	call prompt

	la  a1, buffer_first_number
	lbu a2, buffer_first_number_size
	
	call read	
	
	la  a1, second_number
	lbu a2, second_number_size

	call prompt	

	la  a1, buffer_second_number
	lbu a2, buffer_second_number_size
	
	call read

	#call switch_case
	#call print
	call exit

#print:
#	addi a0, zero, 1
#	mov   a1, t0
#	add  a2, zero, t1
#	addi a7, zero, 64
#	ecall
#	ret

read:
	addi a0, zero, 0
	addi a7, zero, 63
	ecall
	ret

prompt:
	addi a0, zero, 1	
	addi a7, zero, 64
	ecall
	ret

#switch_case:

exit:
	add  a0, zero, zero
	addi a7, zero, 93
	ecall
	ret
