#!/bin/bash

for d in *.sh
do
  # if this is a directory, change into it and process the files
  echo "Changing $d"
  sed -i 's/100 100/100 100/' $d
  sed -i 's/100-100/100-100/' $d
done
