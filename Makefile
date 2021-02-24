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
	rm -rf testall.log ocamlllvm *.diff \
	Matcat_Parser.mli Matcat_Parser.ml \
	*.cmi *.cmo parser.ml parser.mli scanner.ml