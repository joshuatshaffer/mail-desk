[retriever]
type = MultidropIMAPSSLRetriever
envelope_recipient = delivered-to:1
server = imap.gmail.com
port = 993
username = yourusername@gmail.com
password = yourpassword
mailboxes = ("INBOX",)
move_on_delete = .Trash

[destination]
type = MDA_external
path = /usr/local/libexec/dovecot/deliver
arguments = ("-e", "-f", "%(sender)", "-d", "%(recipient)")
user = mailaccess
group = mailaccess

[options]
verbose = 2
read_all = false
delete = false
received = false
delivered_to = false
message_log = ~/.getmail/mvmail.log
