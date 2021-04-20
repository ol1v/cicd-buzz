FROM ubuntu:20.04

LABEL maintainer="Oliver Lennartsson"

ENV DEBIAN_FRONTEND noninteractive

RUN apt update -y && apt upgrade -y && apt install wget -y && apt-get install git -y && apt-get install python3 -y && apt-get clean -y autoclean -y && apt-get autoremove -y && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/ol1v/cicd-buzz.git && cd /cicd-buzz

ADD start.sh /start.sh
RUN chmod +x /start.sh

EXPOSE 25565

ENTRYPOINT ["/start.sh"]
