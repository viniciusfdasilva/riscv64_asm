	.equ STDOUT      , 0
	.equ EXIT_SUCCESS, 0	
	.equ WRITE       , 64
	.equ EXIT        , 93

	.section .data
	msg: .ascii "Hello World!\n"
	
	.section .text
	.global _start
	
	_start:
		# WRITE
		addi a0, zero, STDOUT        # STDOUT value
		la   a1, msg                 # Load message
		addi a2, zero, 13            # Message size		
		addi a7, zero, WRITE         # Write syscall
		ecall                        # Sycall execution

		# EXIT
		addi a0, zero, EXIT_SUCCESS  # Return value
		addi a7, zero, EXIT          # Exit syscall
		ecall                        # Syscall execution
