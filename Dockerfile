FROM ubuntu:16.04

###############################################################################
# System update
###############################################################################
RUN apt update && apt -y upgrade
RUN apt install -y wget 

###############################################################################
# Vagrancy installation
###############################################################################
RUN wget -q https://github.com/ryandoyle/vagrancy/releases/download/0.0.4/vagrancy-0.0.4-linux-x86_64.tar.gz -O /vagrancy.tar.gz
RUN tar xf /vagrancy.tar.gz --strip 1
RUN mkdir /data

EXPOSE 9001
VOLUME /data

###############################################################################
# Start service
###############################################################################
ENTRYPOINT /vagrancy -p 9001
