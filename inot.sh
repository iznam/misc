#!/bin/bash

func_1 ()
{
echo "This is $1"
}

inotifywait -mr -e create /dev/disk | while read path event name; do readlink "$path$name" | grep -o sd[a-z]* ; done | uniq | while read i; do func_1 $i; done
