#!/bin/sh
# Author:		Andreas
# Usage:		./mc.sh <filename>
# Description:	This shell script compiles and runs a single .mc file to test a single test case faster
#				It doesn't check. It simply runs.

LLI="lli"
LLC="llc"
CC="cc"
MATCAT="./matcat.native"
ulimit -t 5

SignalError() {
    if [ $error -eq 0 ]; then
        echo "FAILED"
        error=1
    fi
    echo "  $1"
}

Run() {
    echo $* 1>&2
    eval $* || {
        SignalError "$1 failed on $*"
        return 1
    }
}

basename=`echo $1 | sed 's/.*\\///
                         s/.mc//'`
reffile=`echo $1 | sed 's/.mc$//'`
basedir="`echo $1 | sed 's/\/[^\/]*$//'`/."

Run $MATCAT $1 >$basename.ll &&
Run "$LLC" "-relocation-model=pic" "${basename}.ll" ">" "${basename}.s" &&
Run "$CC" "-o" "${basename}.exe" "${basename}.s" &&
Run ./$basename.exe

rm -f "$basename.exe"
rm -f "$basename.s"
rm -f "$basename.ll"
