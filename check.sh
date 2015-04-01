#!/bin/bash

for d in *
do
  # if this is a directory, change into it and process the files
  if [ -d $d ]
  then
    echo "Checking $d"
    cd $d
    grep -w state err*
    cd ..
  fi
done
