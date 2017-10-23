#!/bin/sh
# wait-for-postgres.sh

set -e

host="$1"
shift
cmd="$@"

until psql -h "$host" -U "postgres" -c '\q'; do
  >&2 echo "Postgres is unavailable - sleeping. Exit code: $?"
  sleep 1
done

>&2 echo "Postgres is up - executing command"
exec $cmdtouch