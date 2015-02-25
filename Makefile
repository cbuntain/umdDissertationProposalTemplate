TARGET=prelim

BIBTEX=bibtex
LATEX=pdflatex
SPELLCHECK=ispell -pspell.txt
VIEWER=evince

main: $(TARGET).pdf

spell:
	$(SPELLCHECK) $(TARGET).tex

view: $(TARGET).pdf
	$(VIEWER) $(TARGET).pdf

$(TARGET).pdf: $(TARGET).tex $(TARGET).bbl
	$(LATEX) $(TARGET).tex

$(TARGET).bbl: $(TARGET).bib $(TARGET).aux
	$(BIBTEX) $(TARGET)
	$(LATEX) $(TARGET).tex

$(TARGET).aux: $(TARGET).tex
	$(LATEX) $(TARGET).tex

clean:
	@-rm -f *.aux *.bbl *.blg *.log *.dvi *.toc *.lof

.PHONY: all view spell clean

