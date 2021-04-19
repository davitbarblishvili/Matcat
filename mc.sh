# Author:       Andreas
# Usage:        ./mc.sh <filename>
# Description:  This shell script compiles and runs a single .mc file

# Path to the LLVM interpreter
LLI="lli"

# Path to the LLVM compiler
LLC="llc"

# Path to the C compiler
CC="cc"

MATCAT="./matcat.native"

ulimit -t 5

basename=`echo $1 | sed 's/.*\\///
                         s/.mc//'`
reffile=`echo $1 | sed 's/.mc$//'`
basedir="`echo $1 | sed 's/\/[^\/]*$//'`/."


Check() {
    if [ $? -ne 0 ]; then
        if [[ "$basename" == *"test-"* ]]; then
            echo "FAILED"
            exit 1
        fi
        if [[ "$basename" == *"fail"* ]]; then
            echo "Failed but that was the plan"
            exit 1
        fi
    fi
}


echo "$MATCAT $1 > $basename.ll"
$MATCAT $1 > $basename.ll
Check

echo "llc -relocation-model=pic $basename.ll > $basename.s"
llc -relocation-model=pic $basename.ll > $basename.s
Check

echo "cc -o $basename.exe $basename.s" "matrixLibrary.o"
cc -o $basename.exe $basename.s matrixLibrary.o
Check


./$basename.exe
Check
