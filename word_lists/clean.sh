#!/usr/bin/env bash

die () {
    echo >&2 "$@"
    exit 1
}

[ "$#" -eq 1 ] || die "1 argument required, $# provided"

tobecleaned=${1}
tmp=$(mktemp)

cp $tobecleaned $tmp
cat $tmp | sort | uniq > $tobecleaned
rm $tmp
