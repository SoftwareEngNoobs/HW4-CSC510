#!/bin/bash

# Find all files with the word sample and at least 3 occurences of CSC510, sort the result based on descending order of occurences and size of file if tie-breker 

grep -l "sample" * | xargs grep -l "CSC510" | xargs grep -c "CSC510" | grep -E ":[3-9]$" | sed 's/:/ /' | gawk '{temp=$1; $1=$2; $2=temp; print}' |   xargs -I {} sh -c 'size=$(stat -f "%z" $(echo {} | cut -d" " -f2)); echo "{} $size"' | sort -nr -k1,1 -k3,3 | cut -d ' ' -f2 | sed 's/file/filtered/' 