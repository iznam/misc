#!/bin/bash

set -- `getopt "abcd:" "$@"`   # разбор аргументов командной строки в позиционные параметры.
while [ ! -z "$1" ]
do
  case "$1" in
    -a) echo "Опция \"a\"";;
    -b) echo "Опция \"b\"";;
    -c) echo "Опция \"c\"";;
    -d) echo "Опция \"d\" $2";;
     *) break;;
  esac
  shift
done
