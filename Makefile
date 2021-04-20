
.PHONY : all
all : matcat.native matrixLibrary.o

matcat.native : matrixLibrary.bc
	opam config exec -- \
	ocamlbuild -use-ocamlfind matcat.native -pkgs llvm,llvm.analysis,llvm.bitreader

matrixLibrary : matrixLibrary.c
	gcc -o matrixLibrary -DBUILD_TEST matrixLibrary.c -lm

matrixLibrary.bc : matrixLibrary.c
	clang -emit-llvm -o matrixLibrary.bc -c matrixLibrary.c -Wno-varargs

%.cmo : %.ml
	ocamlc -c $<

%.cmi : %.mli
	ocamlc -c $<

parser.ml : parser.mly
	ocamlyacc $^

scanner.ml : scanner.mll
	ocamllex $^

.PHONY : clean
clean : 
	ocamlbuild -clean
	rm -rf testall.log ocamlllvm *.diff *.err *.ll *.lli *.exe *.out *.s matcat.native *.mc *.o *.bc
.PHONY : test
test : matcat.native
	./testall.sh

# An excluding way to build the tarball
# may not be a good idea, but let's try for a while
EXCLUDEPATTERNS = .* *_build* MicroC *.log
ECSTRING = $(EXCLUDEPATTERNS:%= --exclude="%" )
tar : clean
	echo ${ECSTRING}
	cd .. && tar ${ECSTRING} -cvf matcat/matcat.tar.gz matcat

