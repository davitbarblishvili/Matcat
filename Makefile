matcat.native :
	opam config exec -- \
	ocamlbuild -use-ocamlfind matcat.native

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
	rm -rf testall.log ocamlllvm *.diff *.err *.ll *.exe *.out *.s *.lli

.PHONY : test
test : testall.sh
	./testall.sh

# An excluding way to build the tarball
# may not be a good idea, but let's try for a while
EXCLUDEPATTERNS = .* *_build* MicroC
ECSTRING = $(EXCLUDEPATTERNS:%= --exclude="%" )
tar : clean
	echo ${ECSTRING}
	cd .. && tar ${ECSTRING} -cvf matcat/matcat.tar.gz matcat