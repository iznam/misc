#!/bin/bash -e

[ -n "$1" ] || { echo "Usage: ${0##*/} IP." 1>&2; exit 1;}
#arr=$(echo $1 | tr "." "\n")

OIFS=$IFS
IFS='.'
unset addr
for i in $1
do
	addr=$addr$(printf "%.2x" "$i")
done
IFS=$OIFS

echo $addr |rev |sed 's/\(....\)/\1:/g'|rev
