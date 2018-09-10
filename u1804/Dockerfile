FROM ubuntu:18.04

RUN apt-get update
RUN apt-get -y install apt-utils
RUN apt-get -y install locales

# Set the locale
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

RUN useradd -d /home/dmitriano -m --uid 1000 dmitriano

RUN apt-get -y install nano

#Install GCC8, CMake and Git
RUN apt install -y gcc-8 g++-8
RUN apt install -y cmake
RUN apt install -y git

#switch to GCC8
RUN update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-8 10 --slave /usr/bin/g++ g++ /usr/bin/g++-8
