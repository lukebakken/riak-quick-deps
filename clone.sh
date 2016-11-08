#!/usr/bin/env bash

set -o errexit

for D in $(<riak-deps.txt)
do
    if [[ $D == https* ]]
    then
        DIR=${D#*/*/*/}
    else
        DIR=${D#*:}
    fi
    if [[ -d $DIR ]]
    then
        echo "[WARNING] dir $DIR already exists, skipping!"
    else
        git clone --mirror $D $DIR
    fi
done
