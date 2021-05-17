# Note - latex (texlive) will update every year (around April 1?).
# The tlmgr command below will use the latest version of texlive.
# If the default image is not the same, there will be problems.
# This is why I don't use a specific version.
FROM pandoc/ubuntu-latex
#RUN curl -L http://sourceforge.net/projects/plantuml/files/plantuml.jar/download -o /usr/bin/plantuml.jar
# Copy the local plantuml.jar (we control the version)
COPY plantuml.jar /usr/bin/plantuml.jar
RUN apt-get update && apt-get install -y \
    python3-pip \
    # PlantUML filter
#    plantuml \
    default-jre \
    graphviz \
    texlive-lang-french \
    # Enable root commands later https://stackoverflow.com/a/48329093/1168342 because LaTeX wants to create fonts dynamically
    sudo \
    && pip3 install pandocfilters \
    # PlantUML binary install - if the first line isn't the shebang, Python won't run it nicely
    && printf '#!/bin/sh\njava -jar /usr/bin/plantuml.jar $@' > /usr/bin/plantuml \
    && chmod +x /usr/bin/plantuml

ENV PLANTUML_BIN="/usr/bin/plantuml"
#RUN echo 'java -jar /usr/bin/plantuml.jar $@' > /usr/bin/plantuml \
# && chmod +x /usr/bin/plantuml

# surgically install texlive packages (keep image smaller)
RUN tlmgr update --self --all \
&& tlmgr install libertinus libertinus-type1 libertinus-fonts libertinus-otf libertinust1math fontawesome fontawesome5 tcolorbox fontaxes environ courier transparent \
&& tlmgr path add

# create the fonts to save time each time a user will use them?
RUN mktexpk --mfmode / --bdpi 600 --mag 1+0/600 --dpi 600 tcrm1095

# Font for handwritten
RUN mkdir -p /usr/share/fonts/TTF
COPY xkcdfont/xkcd-script.ttf /usr/share/fonts/TTF
ENV JAVA_FONTS="/usr/share/fonts/TTF"

# Enable root commands later https://stackoverflow.com/a/48329093/1168342 because LaTeX wants to create fonts dynamically
RUN adduser --disabled-password --gecos '' docker \
&& adduser docker sudo \
&& echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# Override default entrypoint
# ENTRYPOINT ["/usr/local/bin/pandoc"]
ENTRYPOINT ["/usr/bin/sudo", "/usr/local/bin/pandoc"]