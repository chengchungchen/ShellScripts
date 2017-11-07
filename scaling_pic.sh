#!/bin/sh
## This script to scale picture.

ls | grep png | sed 's/.png//g' > pics.txt

while read line
do
    #echo ${line}.png
    convert "${line}.png" -resize 500 "${line}_1.png"
done < pics.txt
