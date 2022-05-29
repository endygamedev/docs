file=main

.PHONY: all clean

all:
	xelatex -interaction=nonstopmode ${file}.tex

clean:
	rubber --clean ${file}.tex
	-rm -f missfont.log
	-rm -f texput.log
	-rm -f ${file}.pdf
