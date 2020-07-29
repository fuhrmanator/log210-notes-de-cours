####################################################################################################
# Configuration
####################################################################################################

BUILD = build
MAKEFILE = Makefile
OUTPUT_FILENAME = LOG210-notes-de-cours
METADATA = metadata.yml
LATEX_TEMPLATE = templates/default.latex
CHAPTERS = chapters/*.md
CHAPTERS_DEP = chapters/*.tex
TOC = --toc --toc-depth=2
IMAGES_FOLDER = images
IMAGES = $(IMAGES_FOLDER)/*
PLANTUML_IMAGES = plantuml-images
COVER_IMAGE = $(IMAGES_FOLDER)/cover.png
TEMPLATES_FOLDER = templates
MATH_FORMULAS = --webtex
CSS_FILE = style.css
CSS_ARG = --css=$(CSS_FILE)
METADATA_ARG = --metadata-file=$(METADATA)
PLANTUML_FILTER = --filter filters/plantuml/plantuml.py
ARGS = $(TOC) $(MATH_FORMULAS) $(CSS_ARG) $(METADATA_ARG) $(PLANTUML_FILTER)
PDF_ARGS = --filter pandoc-citeproc --listing -V geometry:margin=1in --pdf-engine=pdflatex --template=$(TEMPLATES_FOLDER)/default.latex
#PDF_ARGS = --filter pandoc-citeproc --listing -V geometry:margin=1in --pdf-engine=xelatex --template=$(TEMPLATES_FOLDER)/default.latex

####################################################################################################
# Basic actions
####################################################################################################

all:	book

book:	epub html pdf

clean:
	rm -r $(BUILD) $(PLANTUML_IMAGES)

####################################################################################################
# File builders
####################################################################################################

epub:	$(BUILD)/epub/$(OUTPUT_FILENAME).epub

html:	$(BUILD)/html/$(OUTPUT_FILENAME).html

pdf:	$(BUILD)/pdf/$(OUTPUT_FILENAME).pdf

$(BUILD)/epub/$(OUTPUT_FILENAME).epub:	$(MAKEFILE) $(METADATA) $(CHAPTERS) $(CHAPTERS_DEP) templates/default.latex $(CSS_FILE) $(IMAGES) \
		$(COVER_IMAGE)
	mkdir -p $(BUILD)/epub
	mkdir -p $(BUILD)/images
	pandoc $(ARGS) --epub-cover-image=$(COVER_IMAGE) -o $@ $(CHAPTERS)
	@echo "$@ was built"

$(BUILD)/html/$(OUTPUT_FILENAME).html:	$(MAKEFILE) $(METADATA) $(CHAPTERS) $(CSS_FILE) $(IMAGES)
	mkdir -p $(BUILD)/html
	mkdir -p $(BUILD)/images
	pandoc $(ARGS) --standalone --to=html5 -o $@ $(CHAPTERS)
	cp -R $(IMAGES_FOLDER)/ $(BUILD)/html/$(IMAGES_FOLDER)/
	cp $(CSS_FILE) $(BUILD)/html/$(CSS_FILE)
	@echo "$@ was built"

$(BUILD)/pdf/$(OUTPUT_FILENAME).pdf:	$(MAKEFILE) $(METADATA) $(LATEX_TEMPLATE) $(CHAPTERS) $(CSS_FILE) $(IMAGES)
	mkdir -p $(BUILD)/pdf
	mkdir -p $(BUILD)/images
	pandoc $(ARGS) $(PDF_ARGS) -o $@ $(CHAPTERS)
	cp $(BUILD)/pdf/$(OUTPUT_FILENAME).pdf docs/
	@echo "$@ was built"

pdfdebug:	debug.tex
debug.tex:	$(MAKEFILE) $(METADATA) $(CHAPTERS) $(CSS_FILE) $(IMAGES)
	pandoc $(ARGS) $(PDF_ARGS) -o $@ $(CHAPTERS)

