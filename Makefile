# Makefile ALECS

files_tex = $(wildcard *.tex)
cv_name = "alecs"

all: pdf
	@echo "Done"

pdf: *.tex
	@echo "Building... $^"
	@$(foreach var, $(files_tex), xelatex -interaction=nonstopmode -jobname=$(cv_name) '$(var)' 1>/dev/null;)
	@echo "Building bibliography..."
	@$(foreach var, $(files_tex), biber $(cv_name) '$(var)' 1>/dev/null;)
	@echo "Building again... $^"
	@$(foreach var,$(files_tex), xelatex -interaction=nonstopmode -jobname=$(cv_name) '$(var)' 1>/dev/null;)

clean:
	@rm -f *.aux *.dvi *.log *.out *.pdf *.bak *.gz *.xml
	@echo "Done";

cleanbib:
	@rm -f *.bbl *.bcf *.blg
	@echo "Done";

cleanall: clean cleanbib
