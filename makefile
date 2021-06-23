all:
	iverilog -o build/build1 testbench/testbench1.sv
	iverilog -o build/build2 testbench/testbench2.sv

	vvp build/build1 > logs/log1.txt
	echo "---------------------------------------------------------------------" >> logs/log1.txt
	echo "REGISTERS" >> logs/log1.txt
	cat build/registers.txt >> logs/log1.txt
	echo "---------------------------------------------------------------------" >> logs/log1.txt
	echo "MEMORY" >> logs/log1.txt
	cat build/memory.txt >> logs/log1.txt

	vvp build/build2 > logs/log2.txt
	echo "---------------------------------------------------------------------" >> logs/log2.txt
	echo "REGISTERS" >> logs/log2.txt
	cat build/registers.txt >> logs/log2.txt
	echo "---------------------------------------------------------------------" >> logs/log2.txt
	echo "MEMORY" >> logs/log2.txt
	cat build/memory.txt >> logs/log2.txt