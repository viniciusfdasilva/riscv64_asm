# THIS ASSEMBLY FILE CONTAINS THE CALCULATOR'S CODE OF TWO NUMBERS

		.section .rodata

prompt_msg: 	.ascii "Calculator:\n Type [+]: SUM\n Type [-]: SUB\n Type [*]: MUL\n"
prompt_size:	.byte .-prompt_msg

operand_size:   .data
		.section .bss

operand:	.space 255

		.section .text
		.global _start

_start:
	call prompt
	call read
	#call switch_case
	#call print
	call exit

read:
	addi a0, zero, 0
	la   a1, operand
	lbu  a2, operand_size
	addi a7, zero, 63
	ecall
	ret

prompt:
	addi a0, zero, 1
	la   a1, prompt_msg
	lbu  a2, prompt_size	
	addi a7, zero, 64
	ecall
	ret

#switch_case:

exit:
	add  a0, zero, zero
	addi a7, zero, 93
	ecall
	ret
