
name=$(shell basename $(CURDIR))

texsources=$(name).tex

$(name).pdf : $(texsources) $(name).bib figs/
	make -C figs
	pdflatex $(name)
	pdflatex $(name)
	# latexmk -pdf $(name)

reset : clean $(name).pdf

clean :
	rm -f $(name).pdf

install: $(name).pdf
	scp $< cglab.ca:public_html/publications/drafts/$(name)/$(name)-`date --iso`.pdf
