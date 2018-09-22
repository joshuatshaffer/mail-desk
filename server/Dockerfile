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

COPY dovecot.conf /etc/dovecot/dovecot.conf

EXPOSE 143
EXPOSE 993
EXPOSE 4190
#VOLUME /home/vmail
#VOLUME /etc/dovecot/passwd
#VOLUME /getmail

COPY fetch.sh /fetch.sh
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["tail", "--follow", "--retry", "/var/log/dovecot.log"]
