#Calculates values across all files and all rows from original csv files
for d in *
do
  # if this is a directory, change into it and process the files
  if [ -d $d -a "$d" != pops ]
  then
    echo "Processing Weight $d"
    cd $d
    	mv allWeight* ../pops/.
    cd ..
  fi
done
cd pops


