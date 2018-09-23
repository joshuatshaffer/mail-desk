FROM ubuntu:18.04

RUN DEBIAN_FRONTEND=noninteractive apt-get update        \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y \
        getmail4                                         \
        dovecot-imapd                                    \
        dovecot-managesieved                             \
    && DEBIAN_FRONTEND=noninteractive apt-get clean      \
    && rm -rf /var/lib/apt/lists/*                       \
    && ln -s /usr/bin/python2.7 /usr/bin/python2

RUN useradd --no-create-home vmail \
    && mkdir -p /home/vmail        \
    && touch                       \
        /var/log/dovecot.log       \
        /var/log/dovecot-info.log  \
        /var/log/getmail.log       \
    && chown vmail:vmail           \
        /home/vmail                \
        /var/log/dovecot.log       \
        /var/log/dovecot-info.log  \
        /var/log/getmail.log

EXPOSE 143
EXPOSE 993
EXPOSE 4190

#VOLUME /home/vmail
#VOLUME /getmail
#VOLUME /run/secrets

COPY dovecot.conf /etc/dovecot/dovecot.conf
COPY fetch.sh /scripts/fetch.sh
COPY get-passwd.sh /scripts/get-passwd.sh
COPY entrypoint.sh /scripts/entrypoint.sh

ENTRYPOINT ["/scripts/entrypoint.sh"]
CMD ["tail", "--follow", "--retry", "/var/log/dovecot.log"]
