#!/bin/bash

if test -e $1.txt
  then
  rm $1.txt
fi

echo Test begins at $(date +%H:%M:%S)
data()
{
tm=0
while :; do
 d="$(wattsup -c 1 ttyUSB0 watts|sed 's/..$//')"
 echo $(date +%H:%M:%S) $tm $d $1
cat <<EOF >> $1.txt
$tm $d   
EOF
tm=$(( $tm + 10))
sleep 3
done
}

data $1 &
pid=$!

echo "Press Enter to stop script. PID=$pid"

read Enter

kill $pid

