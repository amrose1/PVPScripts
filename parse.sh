#!/bin/bash

for d in *
do
  # if this is a directory, change into it and process the files
  if [ -d $d ]
  then
    echo "Processing $d"
    cd $d
    #rm allWeight*
    ../avg.sh > ../../pops/avg-$d.csv
    cd ..
  fi
done
