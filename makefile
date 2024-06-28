EXEC_DIR=$(shell find -type d -name $(target_dir)*)

install:

ifneq ($(shell arch), 'riscv64')

ifeq ($(shell id -u), 0)
	@apt update -y
	@apt-get install gcc-riscv64-unknown-elf qemu-user -y
else
	@echo 'Please, run this command with sudo!'
endif

else
	@echo 'Is not necessary install packages to riscv64 CPU!'
endif

build:

ifeq ($(shell arch), 'riscv64')
	@as -o $(EXEC_DIR)/output.out $(EXEC_DIR)/*.s
	@ld -o $(EXEC_DIR)/output $(EXEC_DIR)/output.out
else
	@riscv64-unknown-elf-as -o $(EXEC_DIR)/output.out $(EXEC_DIR)/*.s
	@riscv64-unknown-elf-ld -o $(EXEC_DIR)/output $(EXEC_DIR)/output.out
endif

run: 
	$(MAKE) build  

ifeq ($(shell arch), 'riscv64')
	@$(EXEC_DIR)/output $(EXEC)
else
	@qemu-riscv64 $(EXEC_DIR)/output $(EXEC)
endif
	
	$(MAKE) clear

clear:
	@rm -rf $(EXEC_DIR)/*.out $(EXEC_DIR)/output
