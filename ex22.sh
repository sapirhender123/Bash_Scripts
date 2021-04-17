#!/bin/bash

filePath=$1
fileExtension=$2
userWord=$3
userNumber=$4
# todo: if the number is negative

if [ "$#" -ne 4 ]; then
    echo "Not enough parameters"
    exit
fi

#for dir in filepath/**/*.fileExtension
  # for each folder - do it again
  # for each file - do ex 21

# find all unique directories containing files with given extension
files=$(find . -name "*.$fileExtension" -type f -printf "%h\n" | sort -d -v)

for dir in $files
do
  # return/print all the lines that include the user-word.
  result=$(./ex21.sh $dir $fileExtension $userWord)
  while IFS= read -r line; do
    # pass all over the lines that include the word, and check if it more than the number that was input
    if [ $(echo "$line" | wc -w) -ge $userNumber ]
    then
      echo $line
    fi
    # Read from buffer
  done <<< "$result"
done
