#!/bin/bash

filePath=$1
fileExtension=$2
userWord=$3

# todo : check lexicographic sort
#Take only the files with the expected extension
files=$(ls $filePath/*.$fileExtension)
# For each one of the files
for file in ${files[@]}
do
  # Take the whole content of the file
  lines=$(cat $file)
  # Split it to lines
  while IFS= read -r line; do
    # Search only the expected word in the lines
    res=$(echo $line | grep "\b$userWord\b")
    # If the result is not empty, print
    if [ ! -z "$res" ]
    then
      echo $res
    fi
  done < $file;
done
