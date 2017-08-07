FROM ubuntu:16.04

RUN apt-get update
RUN apt-get -y install apt-utils
RUN apt-get -y install locales

# Set the locale
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

RUN useradd -d /home/beauty -m --uid 1009 beauty
RUN useradd -d /home/master -m --uid 1017 master
RUN useradd -d /home/omegauto -m --uid 10019 omegauto

RUN apt-get -y install clamav clamav-daemon
RUN freshclam

