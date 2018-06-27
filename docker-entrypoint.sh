#!/usr/bin/env sh
set -e

if [ "$(printf %c "$1")" = '-' ]; then
  set -- /sbin/tini -- php /composer/vendor/bin/phploc "$@"
elif [ "$1" = "/composer/vendor/bin/phploc" ]; then
  set -- /sbin/tini -- php "$@"
elif [ "$1" = "phploc" ]; then
  set -- /sbin/tini -- php /composer/vendor/bin/"$@"
fi

exec "$@"
