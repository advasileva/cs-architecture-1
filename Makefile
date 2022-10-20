disasm:
	bash ./scripts/disasm.sh main
	bash ./scripts/disasm.sh form_array

test.asm:
	bash ./scripts/compile-asm.sh
	bash ./scripts/test-asm.sh

test.c:
	bash ./scripts/compile-c.sh
	bash ./scripts/test-c.sh

test:
	echo "Test ASM"
	make test.asm
	echo "Test C"
	make test.c

compare:
	bash ./scripts/compile-asm.sh
	bash ./scripts/compile-c.sh
	bash ./scripts/compare.sh

rand.asm:
	bash ./scripts/compile-asm.sh
	bash ./scripts/rand-asm.sh $n

rand.c:
	bash ./scripts/compile-c.sh
	bash ./scripts/rand-c.sh $n

rand:
	echo "Test ASM"
	make rand.asm $n
	echo "Test C"
	make rand.c $n
