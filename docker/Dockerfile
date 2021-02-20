# FROM dalibo/pandocker:latest-alpine
# RUN apk add --no-cache graphviz openjdk11-jre-headless
# RUN tlmgr update --self
# RUN tlmgr install libertinus libertinus-type1 fontawesome tcolorbox fontaxes environ courier

#FROM pandoc/latex:2.11.4
#RUN apk add --no-cache graphviz openjdk11-jre-headless
#RUN tlmgr update --self
#RUN tlmgr install libertinus libertinus-type1 fontawesome tcolorbox fontaxes environ courier

FROM pandoc/ubuntu-latex:2.11.4
RUN apt-get update && apt-get install -y \
    python3-pip \
    # PlantUML filter
    plantuml \
    # LaTeX customizations
    texlive-fonts-extra \
    texlive-latex-recommended \
    texlive-fonts-recommended \
    texlive-lang-french \
    # Enable root commands later https://stackoverflow.com/a/48329093/1168342 because LaTeX wants to create fonts dynamically
    sudo && \
    pip3 install pandocfilters

# Font for handwritten
RUN mkdir -p /usr/share/fonts/TTF
COPY sagefont/sagesans-Regular.ttf /usr/share/fonts/TTF
ENV JAVA_FONTS="/usr/share/fonts/TTF"

# Enable root commands later https://stackoverflow.com/a/48329093/1168342 because LaTeX wants to create fonts dynamically
RUN adduser --disabled-password --gecos '' docker
RUN adduser docker sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# Override default entrypoint
# ENTRYPOINT ["/usr/local/bin/pandoc"]
ENTRYPOINT ["/usr/bin/sudo", "/usr/local/bin/pandoc"]