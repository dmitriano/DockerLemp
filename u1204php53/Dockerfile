FROM ubuntu:12.04

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

RUN apt-get -y install php5-fpm php5-cli php5-mysql php5-gd php5-curl php5-xcache
RUN apt-get -y install mysql-client net-tools iputils-ping

COPY etc/ /etc/
RUN mkdir /var/log/php-fpm

RUN apt-get -y install nano
RUN apt-get -y install supervisor

EXPOSE 9000
CMD ["supervisord", "-n"]
#CMD service php5-fpm start && tail -F /var/log/php5-fpm.log
#CMD ["php5-fpm"]
#ENTRYPOINT /usr/sbin/php5-fpm --nodaemonize
