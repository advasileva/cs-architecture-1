#!/bin/bash

max=3
for i in `seq 1 $max`
do
    echo "Test $i"
    ./asm.exe 0 tests/test$i.in output
    echo
    diff output tests/test$i.out
    echo
done
