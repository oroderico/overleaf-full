FROM sharelatex/sharelatex:latest

RUN tlmgr option repository https://ftp.math.utah.edu/pub/tex/historic/systems/texlive/2025/tlnet-final && \
    tlmgr update --self && \
    tlmgr install scheme-full && \
    tlmgr path add
