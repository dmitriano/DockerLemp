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
RUN useradd -d /home/dmitriano -m --uid 1000 dmitriano

RUN apt-get -y install sendmail
