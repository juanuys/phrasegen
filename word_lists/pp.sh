#!/usr/bin/env bash

die () {
    echo >&2 "$@"
    exit 1
}

[ "$#" -eq 1 ] || die "1 argument required, $# provided"

input=${1}
tmp=$(mktemp)

cp $input $tmp
cat $tmp | jq '.' > $input
rm $tmp
