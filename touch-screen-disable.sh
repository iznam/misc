#!/bin/bash 

#sleep 10

sudo xinput disable "Atmel Atmel maXTouch Digitizer"

echo "Touch screen has been disabled by rc.local" > /dev/kmsg

exit 0
