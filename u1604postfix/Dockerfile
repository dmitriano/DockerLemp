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

RUN apt-get -y install nano
RUN apt-get -y install php

RUN apt-get -y install rsyslog postfix mutt

COPY etc/ /etc/

ARG MAIL_DOMAIN=yandex.ru
ARG MAIL_LOGIN
ARG MAIL_PASSWORD
ARG MAIL_SMTP=smtp.yandex.ru

RUN mkdir /etc/postfix/private
RUN echo "@$MAIL_DOMAIN $MAIL_LOGIN@$MAIL_DOMAIN" > /etc/postfix/private/canonical
RUN echo "[$MAIL_SMTP] $MAIL_LOGIN@$MAIL_DOMAIN:$MAIL_PASSWORD" > /etc/postfix/private/sasl_passwd
RUN echo "@$MAIL_DOMAIN $MAIL_SMTP" > /etc/postfix/private/sender_relay
RUN postmap /etc/postfix/private/*
