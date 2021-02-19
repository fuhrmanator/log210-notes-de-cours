####################################################################################################
# Configuration
####################################################################################################

BUILD = build
MAKEFILE = Makefile
OUTPUT_FILENAME = LOG210-notes-de-cours
METADATA = src/metadata.yml
LATEX_TEMPLATE = src/templates/default.latex
CHAPTERS = src/chapters/*.md
CHAPTERS_DEP = src/chapters/*.tex
TOC = --toc --toc-depth=2
IMAGES_FOLDER = src/images
IMAGES = $(IMAGES_FOLDER)/*
PLANTUML_IMAGES = plantuml-images
COVER_IMAGE = $(IMAGES_FOLDER)/cover.png
TEMPLATES_FOLDER = src/templates
MATH_FORMULAS = --webtex
CSS_FILE = src/style.css
CSS_ARG = --css=$(CSS_FILE)
METADATA_ARG = --metadata-file="$(METADATA)"
PLANTUML_FILTER = --filter=src/filters/plantuml/plantuml_filter.sh
PANDOC_ARGS = $(TOC) $(MATH_FORMULAS) $(CSS_ARG) $(METADATA_ARG) $(PLANTUML_FILTER)
PDF_ARGS = --citeproc --listing -V geometry:margin=1in --pdf-engine=pdflatex --template=$(TEMPLATES_FOLDER)/default.latex
# move only ./src into docker container during pandoc build 
PANDOC_COMMAND = docker run --rm --volume "`pwd`/src:/pandoc" -w /pandoc --user `id -u`:`id -g` log210notesdecours/pandoc-latex-etc:2.11.4
#PANDOC_COMMAND = pandoc

####################################################################################################
# Basic actions
####################################################################################################

all:	book

book:	epub html pdf

clean:
	rm -r $(BUILD) $(PLANTUML_IMAGES)

###
# Docker 
###
install:	Dockerfile
	docker build --pull --rm -f "Dockerfile" -t log210notesdecours/pandoc-latex-etc:2.11.4 "."

####################################################################################################
# File builders
####################################################################################################

epub:	$(BUILD)/epub/$(OUTPUT_FILENAME).epub Dockerfile

html:	$(BUILD)/html/$(OUTPUT_FILENAME).html Dockerfile

pdf:	$(BUILD)/pdf/$(OUTPUT_FILENAME).pdf Dockerfile

$(BUILD)/epub/$(OUTPUT_FILENAME).epub:	$(MAKEFILE) $(METADATA) $(CHAPTERS) $(CHAPTERS_DEP) $(CSS_FILE) $(IMAGES) \
		$(COVER_IMAGE)
	mkdir -p $(BUILD)/epub
	mkdir -p $(BUILD)/images
	$(PANDOC_COMMAND) $(PANDOC_ARGS) --epub-cover-image=$(COVER_IMAGE) -o $@ $(CHAPTERS)
	@echo "$@ was built"

$(BUILD)/html/$(OUTPUT_FILENAME).html:	$(MAKEFILE) $(METADATA) $(CHAPTERS) $(CSS_FILE) $(IMAGES)
	mkdir -p $(BUILD)/html
	mkdir -p $(BUILD)/images
	$(PANDOC_COMMAND) $(PANDOC_ARGS) --standalone --to=html5 -o $@ $(CHAPTERS)
	cp -R $(IMAGES_FOLDER)/ $(BUILD)/html/$(IMAGES_FOLDER)/
	cp $(CSS_FILE) $(BUILD)/html/$(CSS_FILE)
	@echo "$@ was built"

$(BUILD)/pdf/$(OUTPUT_FILENAME).pdf:	$(MAKEFILE) $(METADATA) $(LATEX_TEMPLATE) $(CHAPTERS) $(CSS_FILE) $(IMAGES)
	mkdir -p $(BUILD)/pdf
	mkdir -p $(BUILD)/images
	$(PANDOC_COMMAND) $(PANDOC_ARGS) $(PDF_ARGS) -o $@ $(CHAPTERS)
	cp $(BUILD)/pdf/$(OUTPUT_FILENAME).pdf docs/
	@echo "$@ was built"

pdfdebug:	debug.tex $(LATEX_TEMPLATE) $(MAKEFILE) $(METADATA) $(CHAPTERS) $(IMAGES)
debug.tex:	$(MAKEFILE) $(METADATA) $(CHAPTERS) $(CSS_FILE) $(IMAGES)
	$(PANDOC_COMMAND) $(PANDOC_ARGS) $(PDF_ARGS) -o $@ $(CHAPTERS)
	@echo "$@ was built"

