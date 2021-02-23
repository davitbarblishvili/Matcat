parser.ml : Matcat_Parser.mly
	ocamlyacc $^

clean : 
	rm Matcat_Parser.mli Matcat_Parser.ml