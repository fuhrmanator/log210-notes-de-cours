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
    default-jre-headless \
    graphviz \
    # LaTeX customizations
    texlive-fonts-extra \
#    texlive-fonts-extra-doc \ 
    texlive-latex-recommended \
    texlive-fonts-recommended \
    texlive-lang-french \
    # Enable root commands later https://stackoverflow.com/a/48329093/1168342
    sudo && \
    pip3 install pandocfilters

# Font for handwritten
RUN mkdir -p /usr/share/fonts/TTF
COPY src/filters/plantuml/sagefont/sagesans-Regular.ttf /usr/share/fonts/TTF
ENV JAVA_FONTS="/usr/share/fonts/TTF"

# PlantUML filter
# RUN pip3 install pandocfilters
# RUN apt-get install -y default-jre-headless
# RUN apt-get install -y graphviz

# kpathsea 
# RUN apt-get install -y texlive-fonts-extra-links
#RUN tlmgr update --self
#RUN tlmgr install babel-french
#RUN tlmgr install libertinus libertinus-type1 fontawesome tcolorbox fontaxes environ courier
#RUN tlmgr install transparent
#RUN tlmgr install fontawesome5
#RUN tlmgr install koma-script
#RUN tlmgr install sourcesanspro sourcecodepro sourceserifpro
#RUN mktexpk --mfmode / --bdpi 600 --mag 1+0/600 --dpi 600 tcrm1095

# allow the commands to run with sudo https://stackoverflow.com/a/64161687/1168342
#RUN mkdir /etc/sudoers.d
#RUN echo "user ALL=(root) NOPASSWD:ALL" > /etc/sudoers.d/user.perms && \
#    chmod 0440 /etc/sudoers.d/user.perms

# RUN apt-get update \
#  && apt-get install -y sudo

# Enable root commands later https://stackoverflow.com/a/48329093/1168342
RUN adduser --disabled-password --gecos '' docker
RUN adduser docker sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# Override default entrypoint
# ENTRYPOINT ["/usr/local/bin/pandoc"]
ENTRYPOINT ["/usr/bin/sudo", "/usr/local/bin/pandoc"]