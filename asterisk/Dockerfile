FROM ubuntu:24.04

RUN apt update
RUN apt -y upgrade

RUN apt -y install apt-utils
RUN apt -y install locales
RUN apt -y install nano

# Set the locale
RUN locale-gen en_US.UTF-8
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US:en
ENV LC_ALL=en_US.UTF-8

RUN apt -y install nano
RUN apt -y install iproute2
RUN apt -y install telnet
RUN apt -y install tcpdump
RUN apt -y install iputils-ping
RUN apt -y install build-essential
RUN apt -y install bison wget openssl libssl-dev
RUN apt -y install libasound2-dev libc6-dev libxml2-dev
RUN apt -y install libsqlite3-dev libnewt-dev libncurses-dev zlib1g-dev
RUN apt -y install gcc g++ make perl uuid-dev git subversion unixodbc-dev unixodbc
RUN apt -y install autoconf libedit-dev libsrtp2-dev libspandsp-dev bzip2 libcurl4-openssl-dev libopus-dev

VOLUME /var/lib/asterisk

RUN useradd -d /home/asterisk -m --uid 2000 asterisk
USER asterisk
WORKDIR /home/asterisk
RUN wget http://downloads.asterisk.org/pub/telephony/asterisk/asterisk-22-current.tar.gz
RUN tar -xzf asterisk-22-current.tar.gz

# Does no work:
# RUN ASTERISK_SRC_DIR=$(realpath $(ls -d */|head -n 1))
# WORKDIR $ASTERISK_SRC_DIR

WORKDIR /home/asterisk/asterisk-22.2.0
RUN ./configure --with-jansson-bundled
RUN make

USER root
WORKDIR /home/asterisk/asterisk-22.2.0
RUN make install && make config && make samples

WORKDIR /etc/asterisk
RUN mkdir ssl
RUN openssl req -days 1825 -nodes -new -x509 -keyout ssl/priv_key.pem -out ssl/cert.pem -subj \
    "/C=US/ST=Delaware/L=New Castle/O=RogaAndK/OU=K-department/CN=developernote.com"

# Copy my config
# COPY --chown=asterisk:asterisk etc/ /etc/
RUN mv /etc/asterisk/extensions.conf /etc/asterisk/extensions.conf.bak
RUN mv /etc/asterisk/pjsip.conf /etc/asterisk/pjsip.conf.bak
RUN mv /etc/asterisk/rtp.conf /etc/asterisk/rtp.conf.bak
COPY etc/ /etc/

ARG NEO_PASSWORD=123parol
ARG MORPHEUS_PASSWORD=parol321
ARG RABBIT_PASSWORD=krol456
RUN sed -i -e "s/neo_parol/$NEO_PASSWORD/g" /etc/asterisk/pjsip.conf
RUN sed -i -e "s/morpheus_parol/$MORPHEUS_PASSWORD/g" /etc/asterisk/pjsip.conf
RUN sed -i -e "s/rabbit_parol/$RABBIT_PASSWORD/g" /etc/asterisk/pjsip.conf

CMD /usr/sbin/asterisk -vvvvvvvvfp
