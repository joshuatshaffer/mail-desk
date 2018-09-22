#!/bin/bash

/etc/init.d/dovecot start

exec "$@"
