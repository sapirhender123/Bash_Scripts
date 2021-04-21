#!/bin/bash
# Sapir Hender 208414573
filePath=$1
fileExtension=$2
userWord=$3

if [ "$#" -lt 3 ]; then
    echo "Not enough parameters"
    exit
fi

#echo $filePath
#echo $fileExtension
#echo $userWord
# todo : check lexicographic sort
# Take only the files with the expected extension
files=$(ls $filePath/*.$fileExtension | LC_ALL=C sort -d | LC_ALL=C sort -V)

# For each one of the files
#echo $files
for file in ${files[@]}
do
  # Take the whole content of the file
  # Split it to lines
  IFS=''
  while read line || [ -n "$line" ]
  do
    # Search only the expected word in the lines
    res=$(echo $line | grep -i "\b$userWord\b")
    # If the result is not empty, print
    if [ ! -z "$res" ]
    then
      echo $res
    fi
  done < $file
done
