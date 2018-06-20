FROM ubuntu:latest
LABEL maintainer="henry@toasterlint.com"

RUN apt-get -y update && apt-get -y dist-upgrade && apt-get -y install wget && mkdir /opt/pmmp && useradd -r pmmp && chown -R pmmp:pmmp /opt/pmmp

USER pmmp:pmmp

RUN cd /opt/pmmp && wget -q -O - https://get.pmmp.io | bash -s - -v development
RUN mkdir /opt/pmmp/plugins && wget -O /opt/pmmp/plugins/PocketMine-DevTools.phar https://poggit.pmmp.io/r/34069/PocketMine-DevTools.phar

VOLUME /opt/pmmp
WORKDIR /opt/pmmp

EXPOSE 19132
EXPOSE 19132/udp

CMD ["./start.sh", "--no-wizard", "--enable-rcon=on"]
