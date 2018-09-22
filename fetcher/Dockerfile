FROM ubuntu:18.04

RUN DEBIAN_FRONTEND=noninteractive apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y dovecot-imapd

RUN useradd -ms /bin/bash joshua \
    && echo "joshua:password" | chpasswd

COPY dovecot.conf /etc/dovecot/dovecot.conf

EXPOSE 143

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["tail", "--follow", "--retry", "/var/log/dovecot.log"]
