#!/bin/bash

set -e

/etc/init.d/dovecot start

/fetch.sh

exec "$@"
