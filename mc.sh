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

echo "$MATCAT $1 > $basename.ll"
$MATCAT $1 > $basename.ll

echo "llc -relocation-model=pic $basename.ll > $basename.s"
llc -relocation-model=pic $basename.ll > $basename.s

echo "cc -o $basename.exe $basename.s"
cc -o $basename.exe $basename.s

./$basename.exe