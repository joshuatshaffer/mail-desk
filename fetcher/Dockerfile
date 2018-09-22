FROM ubuntu:18.04

RUN DEBIAN_FRONTEND=noninteractive apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y getmail4
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y dovecot-imapd
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y dovecot-managesieved

RUN useradd --no-create-home dovecot \
    && useradd --no-create-home dovenull \
    && useradd --no-create-home vmail \
    && mkdir -p /home/vmail
    && touch /var/log/dovecot.log /var/log/dovecot-info.log \
    && chown vmail:vmail /home/vmail /var/log/dovecot.log /var/log/dovecot-info.log

COPY dovecot.conf /etc/dovecot/dovecot.conf

EXPOSE 143
EXPOSE 993
EXPOSE 4190
#VOLUME /home/vmail
#VOLUME /etc/dovecot/passwd

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["tail", "--follow", "--retry", "/var/log/dovecot.log"]
