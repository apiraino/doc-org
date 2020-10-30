FROM debian:buster

ARG DEBIAN_FRONTEND=noninteractive

RUN apt -q update
RUN apt -yq upgrade

# install emacs for org mode
RUN apt -yq install emacs

# install latex
RUN apt -yq install texlive-full texlive-humanities texlive-pictures texlive-publishers texlive-science

# install fonts
RUN apt -yq install fonts-liberation2 # free equivalent of microsoft fonts

RUN apt -yq install jq # json parser

# create graphs with latex
RUN apt -yq install graphviz

# syntax highlight
RUN apt -yq install python3-pygments

# Set the working directory
WORKDIR /root/project

COPY src /root/src

RUN chmod +x -R /root/src/

CMD "/root/src/run.sh"