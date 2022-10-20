disasm:
	bash ./scripts/disasm.sh

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
