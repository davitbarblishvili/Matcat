matcat.native :
	opam config exec -- \
	ocamlbuild -use-ocamlfind matcat.native

%.cmo : %.ml
	ocamlc -c $<

%.cmi : %.mli
	ocamlc -c $<

parser.ml : Matcat_Parser.mly
	ocamlyacc $^

scanner.ml : scanner.mll
	ocamllex $^

.PHONY : clean
clean : 
	ocamlbuild -clean
	rm -rf testall.log ocamlllvm *.diff