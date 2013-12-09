#!/bin/bash
echo "*************"
echo 0. EXIT
echo 1. Stress CPU
echo 2. Stress Memory
echo 3. Monitor
echo "*************"
read -p "Input choice " aa 
case $aa in
	"0")
		exit 0;;
	"1")
		/root/1.sh
		;;
	"2")
		/root/2.sh
		;;	
	"3")
		/root/3.sh
		;;
esac
