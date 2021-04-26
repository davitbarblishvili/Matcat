#!/bin/bash
# Author: James
# Automate making test files and corresponding .out/.err files


echo 'func main() int {
    matrix m; 
    m = [[1,2,3]];
    printm(m);

    return 0;
}' > tests/$1.mc

if [[ "$1" == *"test-"* ]]; then
    touch tests/$1.out
fi


if [[ "$1" == *"fail-"* ]]; then
    touch tests/$1.err
fi