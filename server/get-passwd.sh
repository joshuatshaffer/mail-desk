#!/bin/bash

set -e

cat /run/secrets/mail-passwd/$1.txt
