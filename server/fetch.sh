#!/bin/bash

for RC in $(ls -1 /getmail/*.getmailrc); do
    echo "- Getting with $RC"
    getmail -g /getmail -r ${RC##*/}
done
