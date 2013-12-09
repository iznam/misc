#!/bin/bash

Max=1
dimm ()
{
   if  [ "$Max" -gt "$4" ]
     then 
       Max=$Max
     else  
       Max=$4
   fi
}

while read line; do
 dimm $line
done < lab-test.dat

echo "Max=" $Max
