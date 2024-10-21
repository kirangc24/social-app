#!/bin/bash

# Usage: wait-for-it.sh host:port [-t timeout] [-- command args]
# The script will wait for the specified host:port to become available.

HOST="$1"
PORT="$2"
TIMEOUT=15

if [[ $HOST == "" || $PORT == "" ]]; then
    echo "Usage: $0 host:port [-t timeout] [-- command args]"
    exit 1
fi

if [[ "$3" == "-t" ]]; then
    TIMEOUT="$4"
    shift 4
else
    shift 2
fi

echo "Waiting for $HOST:$PORT..."

for ((i=0; i<TIMEOUT; i++)); do
    nc -z $HOST $PORT && break
    echo "Waiting..."
    sleep 1
done

if ! nc -z $HOST $PORT; then
    echo "Timeout: $HOST:$PORT is not available."
    exit 1
fi

echo "$HOST:$PORT is available. Executing command..."
exec "$@"
