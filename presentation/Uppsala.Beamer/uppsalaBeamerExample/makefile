.PHONY: clean cleanall
.SUFFIXES:  # Delete the default suffixes

EXTS := aux aux.bak log dvi nav snm toc ps pdf
LATEXMK:=./latexmk

NAME=beamerUppsalaExample
#######################################
## TARGETS
#######################################

all: ${NAME}.pdf

%.dvi:%.tex
	${LATEXMK} $<
#	export TEXINPUTS=../themes//:${TEXINPUTS}:../themes/theme/uu//; ${LATEXMK} $<

%.ps:%.dvi
	@dvips -R0 $< -o

%.pdf:%.ps
	@ps2pdf $<


#######################################
view:${NAME}.ps
	@gv $<

pdf:${NAME}.pdf
	@acroread $<

clean:
	@rm -f $(addprefix ${NAME}.,${EXTS})
	@echo "Cleaning done...."
