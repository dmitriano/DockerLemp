FROM ubuntu:16.04

RUN apt-get update
RUN apt-get -y install apt-utils
RUN apt-get -y install locales

# Set the locale
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

RUN apt-get -y install software-properties-common
RUN apt-get update
