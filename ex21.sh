#!/bin/bash
# Sapir Hender 208414573
filePath=$1
fileExtension=$2
userWord=$3

if [ "$#" -ne 3 ]; then
    echo "Not enough parameters"
    exit
fi

# todo : check lexicographic sort
# Take only the files with the expected extension
files=$(ls $filePath/*.$fileExtension | sort -d -V)

# For each one of the files
for file in ${files[@]}
do
  # Take the whole content of the file
  # Split it to lines
  while IFS= read -r line; do
    # Search only the expected word in the lines
    res=$(echo $line | grep "\b$userWord\b")
    # If the result is not empty, print
    if [ ! -z "$res" ]
    then
      echo $res
    fi
  done < $file
done
