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
BIBLIOGRAPHY = biblio.bib
TEMPLATES_FOLDER = templates
MATH_FORMULAS = --webtex
CSS_FILE = style.css
CSS_ARG = --css=$(CSS_FILE)
METADATA_ARG = --metadata-file="$(METADATA)"
PLANTUML_FILTER = --filter=filters/plantuml/pandoc_plantuml_filter.py
HIGHLIGHT_STYLE = --highlight-style templates/my_kate.theme
PANDOC_ARGS = $(TOC) $(MATH_FORMULAS) $(CSS_ARG) $(METADATA_ARG) $(PLANTUML_FILTER) $(HIGHLIGHT_STYLE) --citeproc
PDF_ARGS = -V geometry:margin=1in --pdf-engine=pdflatex --template=$(TEMPLATES_FOLDER)/default.latex
# Note MSYS_NO_PATHCONV=1 because of a bug in paths in Git Bash in windows 
# https://stackoverflow.com/a/34386471/1168342
# use "//" rather than "/" on the directories see https://github.com/docker/for-win/issues/6754#issuecomment-629702199
PANDOC_COMMAND = MSYS_NO_PATHCONV=1 docker run -e TZ=America/Toronto --rm --volume "`pwd`:/working_dir" -w /working_dir --user `id -u`:`id -g` -u root log210ndc/pandoc-latex-etc:2.x
#PANDOC_COMMAND = pandoc

####################################################################################################
# Basic actions
####################################################################################################

all:	book

# Only PDF is working for now 
#  The other formats break because cross references are used with LaTeX codes in the markdown
#  and because the PlantUML filter wasn't tested with them.
book:	pdf # epub html 

clean:
	rm -rf $(BUILD) $(PLANTUML_IMAGES)

####################################################################################################
# File builders
####################################################################################################

epub:	$(BUILD)/epub/$(OUTPUT_FILENAME).epub 

html:	$(BUILD)/html/$(OUTPUT_FILENAME).html 

pdf:	$(BUILD)/pdf/$(OUTPUT_FILENAME).pdf 

#$(BUILD)/epub/$(OUTPUT_FILENAME).epub:	$(MAKEFILE) $(METADATA) $(CHAPTERS) $(CHAPTERS_DEP) $(CSS_FILE) $(IMAGES) \ 
$(BUILD)/epub/$(OUTPUT_FILENAME).epub:	$(MAKEFILE) $(METADATA) $(CHAPTERS) $(CSS_FILE) $(IMAGES) $(BIBLIOGRAPHY) \
		$(COVER_IMAGE)
	mkdir -p $(BUILD)/epub
	mkdir -p $(BUILD)/images
	$(PANDOC_COMMAND) $(PANDOC_ARGS) --epub-cover-image=$(COVER_IMAGE) -o $@ $(CHAPTERS)
	@echo "$@ was built"

$(BUILD)/html/$(OUTPUT_FILENAME).html:	$(MAKEFILE) $(METADATA) $(CHAPTERS) $(CSS_FILE) $(IMAGES) $(BIBLIOGRAPHY)
	mkdir -p $(BUILD)/html
	mkdir -p $(BUILD)/images
	$(PANDOC_COMMAND) $(PANDOC_ARGS) --standalone --to=html5 -o $@ $(CHAPTERS)
	cp -R $(IMAGES_FOLDER)/ $(BUILD)/html/$(IMAGES_FOLDER)/
	cp $(CSS_FILE) $(BUILD)/html/$(CSS_FILE)
	@echo "$@ was built"

$(BUILD)/pdf/$(OUTPUT_FILENAME).pdf:	$(MAKEFILE) $(METADATA) $(LATEX_TEMPLATE) $(CHAPTERS) $(CSS_FILE) $(IMAGES) $(BIBLIOGRAPHY)
	mkdir -p $(BUILD)/pdf
	mkdir -p $(BUILD)/images
	chmod a+x filters/plantuml/pandoc_plantuml_filter.py 
#	$(PANDOC_COMMAND) --list-highlight-languages 
#	$(PANDOC_COMMAND) --list-highlight-styles
#	$(PANDOC_COMMAND) -D latex > new_default.latex
	$(PANDOC_COMMAND) $(PANDOC_ARGS) $(PDF_ARGS) -o $@ $(CHAPTERS)
	cp $(BUILD)/pdf/$(OUTPUT_FILENAME).pdf ../docs/
	@echo "$@ was built"

pdfdebug:	debug.tex $(LATEX_TEMPLATE) $(MAKEFILE) $(METADATA) $(CHAPTERS) $(IMAGES)
debug.tex:	$(MAKEFILE) $(METADATA) $(CHAPTERS) $(CSS_FILE) $(IMAGES)
	$(PANDOC_COMMAND) $(PANDOC_ARGS) $(PDF_ARGS) -o $@ $(CHAPTERS)
	@echo "$@ was built"

