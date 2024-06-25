	# PROMPT
	.equ STDOUT, 1
	.equ WRITE , 64
	
	# READ
	.equ STDIN, 0
	.equ BUF_S, 255
	.equ READ , 63
	.equ EXIT , 93

	.section .rodata
	prompt_msg:      .ascii "Welcome! Type your name\n"
	prompt_msg_size: .byte .-prompt_msg
	greetings_msg:   .asciz "Hi "
	greetings_size:  .byte .-greetings_msg
	buffer_size: .byte .-buffer
	
 	.section .bss
	buffer: .space 256
	
	.section .text
	.global _start

	prompt:
		addi a0, zero, STDOUT     # Get stdout code
		la   a1, prompt_msg       # Load prompt_msg
		lbu  a2, prompt_msg_size  # Load prompt_msg size
		addi a7, zero, WRITE      # Get write syscall
		ecall                     # Execute syscall
		ret
	
	input:
		addi a0, zero, STDIN  # Load stdin code
		la   a1, buffer       # Load buffer
		addi a2, zero, BUF_S  # Load buffer size
		addi a7, zero, READ   # Get read syscall
		ecall                 # Execute syscall
		ret
	
	print:
		# Print greetings message
		addi a0, zero, STDOUT   # Get stdout code
		la   a1, greetings_msg  # Load greetings message
		lbu  a2, greetings_size	# Load greetings size
		addi a7, zero, WRITE    # Get write syscall
		ecall                   # Execute syscall
			
		# Print name
		addi a0, zero, STDOUT # Get stdout code
                la   a1, buffer       # Load buffer with name
                lbu  a2, buffer_size  # Load buffer size
                addi a7, zero, WRITE  # Get write syscall
                ecall                 # Execute syscall
                ret

	exit:
		add  a0, zero, zero # Execution returned status = 0
		addi a7, zero, EXIT # Exit syscall
		ecall               # Execute syscall
		ret

	_start:
		call prompt
		call input
		call print
		call exit
