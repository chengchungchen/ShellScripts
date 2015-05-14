#!/bin/bash
# This script show the how to read contect of file by row

# Method 1:
while read line
do
	echo $line
done < file

# Metho 2:
for line in $( cat ./file )
do
	echo $line
done
