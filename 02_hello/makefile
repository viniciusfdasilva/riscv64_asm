
build:
	@as -o output.out ./*.s
	@ld -o output output.out

run: 
	$(MAKE) build  
	@./output $(EXEC)
	$(MAKE) clear

clear:
	@rm -rf ./*.out output
