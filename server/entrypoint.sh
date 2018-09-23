#!/bin/bash

set -e

/etc/init.d/dovecot start

/scripts/fetch.sh

exec "$@"
