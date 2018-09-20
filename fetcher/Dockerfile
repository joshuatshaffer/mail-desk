FROM ubuntu:18.04

RUN DEBIAN_FRONTEND=noninteractive apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y fetchmail
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y dovecot-imapd
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y postfix

ARG USERNAME
ARG PASSWORD
RUN useradd -ms /bin/bash $USERNAME \
    && echo "$USERNAME:$PASSWORD" | chpasswd

COPY fetchmailrc /etc/fetchmailrc
ARG EMAILADDR
ARG EPASSWORD
RUN sed -i "s/<EMAILADDR>/$EMAILADDR/g; s/<EPASSWORD>/$EPASSWORD/g; s/<USERNAME>/$USERNAME/g;" /etc/fetchmailrc
RUN cat /etc/fetchmailrc
RUN chmod 0400 /etc/fetchmailrc

COPY dovecot.conf /etc/dovecot/dovecot.conf

CMD /etc/init.d/dovecot start && postfix start && bash
#/etc/init.d/dovecot start && fetchmail -v -f /etc/fetchmailrc &&
