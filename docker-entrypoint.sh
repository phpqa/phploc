#!/bin/sh
set -e

if [ "${1:0:1}" = "-" ]; then
  set -- /sbin/tini -- php /vendor/bin/phploc "$@"
elif [ "$1" = "/vendor/bin/phploc" ]; then
  set -- /sbin/tini -- php "$@"
elif [ "$1" = "phploc" ]; then
  set -- /sbin/tini -- php /vendor/bin/"$@"
fi

exec "$@"
