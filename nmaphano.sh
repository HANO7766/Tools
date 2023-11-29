#!/bin/bash

function ctrl_c() {
    echo -e "\nSaliendo..."
}

trap ctrl_c SIGINT

if [ "$1" ]; then
    ip=$1
    for i in {1..90}; do
        if timeout 1 bash -c "echo '' > /dev/tcp/$ip/$i"; then
            echo "Puerto $i: Abierto"
        fi
    done 2> /dev/null
else
    echo "Modo de uso: ./nmaphano.sh [IP]"
fi
