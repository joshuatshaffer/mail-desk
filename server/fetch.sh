#!/bin/bash

for RC in $(ls -1 /getmail/*.getmailrc); do
    echo "- Getting with $RC"
    nohup getmail -g /getmail -r ${RC##*/} --idle INBOX &
done
