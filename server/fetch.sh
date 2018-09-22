#!/bin/bash
ln -s /usr/bin/python2.7 /usr/bin/python2
for RC in $(ls -1 /getmail/*.getmailrc); do
    echo "- Getting with $RC"
    getmail -g /getmail -r ${RC##*/}
done
