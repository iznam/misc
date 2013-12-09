#!/bin/bash

set -- `getopt "abcd:" "$@"`   
while [ ! -z "$1" ]
do
  case "$1" in
    -a) echo "option \"a\"";;
    -b) echo "option \"b\"";;
    -c) echo "option \"c\"";;
    -d) echo "option \"d\" $2";;
     *) break;;
  esac
  shift
done
