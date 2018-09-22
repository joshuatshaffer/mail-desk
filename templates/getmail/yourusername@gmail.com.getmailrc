[retriever]
type = MultidropIMAPSSLRetriever
envelope_recipient = delivered-to:1
server = imap.gmail.com
port = 993
username = yourusername@gmail.com
password = yourapppassword
mailboxes = ("INBOX",)
move_on_delete = .Trash

[destination]
type = MDA_external
path = /usr/lib/dovecot/deliver
arguments = ("-e", "-f", "%(sender)", "-d", "yourusername")
user = vmail
group = vmail

[options]
verbose = 2
read_all = false
delete = false
received = false
delivered_to = false
message_log = /var/log/getmail.log
