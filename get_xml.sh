#!/bin/bash

while getopts "d:f:h" arg
 do
  case $arg in
   d ) dir=$OPTARG ;;
   f ) file=$OPTARG ;;
   h ) echo "
Usage: $0 -d [directory] -f [mid file] -h [help]
     -d name of new directory (folder)
     -f mid file
     -h this help"
    exit 0 ;;
   ? ) echo "No argument value for option $OPTARG" ;;
  esac
 done
shift $OPTIND

message()
{
echo 
"Usage: $0 -d [directory] -f [mid file] -h [help]
      -d name of new directory (folder)
      -f mid file
      -h this help"
echo " " 
exit 1
}    

[ -n "$dir" ] || message "Please set name of new folder for XML files: -d "
[ -n "$file" ] || message "Please set name of input MID file: -f "

if [ -e $dir ]; then
   echo -e "
    WARNING!!! The folder $dir already exist!
    Do you want to rewrite this folder? [Yy/Nn]"
while :; do
   read -s -n 1 answ
   case "$answ" in
   [yY]) rm $dir
   break
   ;;
   [nN]) exit 0
   ;;
   *) echo "
   Wrong answer! Just say \"yes [yY]\" or \"no [nN]\" "
   esac
 done  
fi  

mkdir $dir

cookie=$cookie_path
wmi=$wmi_path

get_xml ()
{
mid=$1
curl -b 'Session_id='$cookie'' '$server_path'$mid'' > $dir/$mid.xml
}

cat $file | while read line; do
	get_xml $line
done
