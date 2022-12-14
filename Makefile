make-asm: # Лучше не запускать, потому что будет обновлена ассемблерная программа
	bash ./scripts/make-asm.sh main
	bash ./scripts/make-asm.sh form_array

test.asm:
	bash ./scripts/test-asm.sh

test.c:
	bash ./scripts/test-c.sh

test:
	echo "Test ASM"
	make test.asm
	echo "Test C"
	make test.c

compile.asm:
	bash ./scripts/compile-asm.sh
	echo "ASM compiled"

compile.c:
	bash ./scripts/compile-c.sh
	echo "C compiled"

compile:
	make compile.asm
	make compile.c

compare:
	bash ./scripts/compare.sh

rand.asm:
	echo "Test ASM"
	bash ./scripts/rand-asm.sh $n

rand.c:
	echo "Test C"
	bash ./scripts/rand-c.sh $n

optimize:
	bash ./scripts/optimize.sh

compare.opt:
	bash ./scripts/compare-opt.sh

lines: # Если интересно, какого размера проект)
	find . | xargs wc -l |& tail -1
