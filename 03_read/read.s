	.equ  STDIN , 0
	.equ  READ  , 63
	.equ  EXIT  , 93
	.equ  BUFF_S, 255

	.section .bss
	buffer: .space 256

	.section .text
	.global _start
	
	_start:
		call read
		call exit
	
	read:
		addi a0, zero, STDIN  # stdin
		la   a1, buffer       # Load buffer
		addi a2, zero, BUFF_S # Get buffer size
		addi a7, zero, READ   # Get read syscall 
		ecall                 # Execute syscall
		ret

	exit:
		add a0, zero, zero   # Return value
		addi a7, zero, EXIT  # Exit syscall
		ecall                # Execute syscall
