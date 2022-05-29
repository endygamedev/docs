FILE=main
TEMPLATE=../template

.PHONY: all clean remove

all: style
	xelatex -interaction=nonstopmode $(FILE).tex

style:
	cp $(TEMPLATE)/spbseu.cls .
	cp $(TEMPLATE)/title.sty .
	cp $(TEMPLATE)/logo.png .
	cp $(TEMPLATE)/gost-numeric.bbx .
	cp $(TEMPLATE)/listings-rust.sty .

clean:
	rubber --clean $(FILE).tex
	-rm -f $(FILE).toc
	-rm -f missfont.log
	-rm -f texput.log
	-rm -f logo.png
	-rm -f spbseu.cls
	-rm -f title.sty
	-rm -f gost-numeric.bbx
	-rm -f listings-rust.sty

remove: clean
	-rm -f $(FILE).pdf
