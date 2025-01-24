FROM ubuntu:24.04

RUN apt update
RUN apt -y install apt-utils
RUN apt -y install locales
RUN apt -y install nano

# Set the locale
RUN locale-gen en_US.UTF-8
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US:en
ENV LC_ALL=en_US.UTF-8

RUN apt -y install openssl

VOLUME /var/lib/ejabberd

# ejabberd does not run with this
# RUN useradd --uid 10001 ejabberd

RUN apt -y install ejabberd

# python can be used to update a YAML file in future.
RUN mv /etc/ejabberd/ejabberd.yml /etc/ejabberd/ejabberd.yml.bak
RUN mv /etc/ejabberd/ejabberd.pem /etc/ejabberd/ejabberd.pem.bak
COPY --chown=ejabberd:ejabberd etc/ /etc/

# HTTP/HTTPS for Web Admin and many more (ejabberd_http)
EXPOSE 5280

# Jabber/XMPP client connections, plain or STARTTLS (ejabberd_c2s)
EXPOSE 5222

# Jabber/XMPP incoming server connections (ejabberd_s2s_in)
EXPOSE 5269

# SOCKS5 file transfer proxy (mod_proxy65)
EXPOSE 7777

RUN mkdir /run/ejabberd && chown ejabberd:ejabberd /run/ejabberd

USER ejabberd

CMD ["ejabberdctl", "foreground"]
