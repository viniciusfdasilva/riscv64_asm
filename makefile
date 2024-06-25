EXEC_DIR=$(shell find -type d -name $(target_dir)*)

build:
	@as -o $(EXEC_DIR)/output.out $(EXEC_DIR)/*.s
	@ld -o $(EXEC_DIR)/output $(EXEC_DIR)/output.out

run: 
	$(MAKE) build  
	@$(EXEC_DIR)/output $(EXEC)
	$(MAKE) clear

clear:
	@rm -rf $(EXEC_DIR)/*.out $(EXEC_DIR)/output
