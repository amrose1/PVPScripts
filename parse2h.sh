#Calculates values across all files and all rows from original csv files
for d in *
do
  # if this is a directory, change into it and process the files
  if [ -d $d -a "$d" != pops ];
  then
    echo "Processing 2 $d"
    cd $d
    paste -d, *.csv-proc |  awk -f ../avg2h.awk > ../pops/avg2-$d.csv
    cd ..
  fi
done
cd pops

#Find the average of all columns in the files created above and add to end of files
for d in avg2-*.csv
do
    echo "Processing Final Average $d"
    awk -f ../avg3h.awk $d >> $d
done

