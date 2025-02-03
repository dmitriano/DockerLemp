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
RUN apt install -y iputils-ping
RUN apt -y install build-essential
RUN apt -y install bison wget openssl libssl-dev
RUN apt -y install libasound2-dev libc6-dev libxml2-dev
RUN apt -y install libsqlite3-dev libnewt-dev libncurses-dev zlib1g-dev
RUN apt -y install gcc g++ make perl uuid-dev git subversion unixodbc-dev unixodbc
RUN apt -y install autoconf libedit-dev libsrtp2-dev libspandsp-dev bzip2 libcurl4-openssl-dev libopus-dev

RUN useradd -d /home/asterisk -m --uid 2000 asterisk

VOLUME /var/lib/asterisk

USER asterisk
WORKDIR /home/asterisk
RUN wget http://downloads.asterisk.org/pub/telephony/asterisk/asterisk-22-current.tar.gz
RUN tar -xzf asterisk-22-current.tar.gz
WORKDIR /home/asterisk/asterisk-22.1.1
RUN ./configure --with-jansson-bundled
RUN make

USER root
WORKDIR /home/asterisk/asterisk-22.1.1
RUN make install && make config && make samples

# Copy my config
# COPY --chown=asterisk:asterisk etc/ /etc/
# COPY etc/ /etc/

# CMD /usr/sbin/asterisk -vvvvvvvvgc
CMD /usr/sbin/asterisk -vvvvvvvvfp
