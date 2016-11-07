#!/usr/bin/env bash

set -o errexit

for D in $(find . -type d -name '*.git')
do
    (cd $D && git fetch --all) &
done
wait
echo DONE
