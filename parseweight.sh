#Calculates values across all files and all rows from original csv files
for d in w3T*
do
  # if this is a directory, change into it and process the files
  if [ -d $d -a "$d" != pops ]
  then
    echo "Processing Weight $d"
    cd $d
    cat weight* | awk -f ../PweightAvgPerFileNaN.awk > allWeights-${d}.csv
    cp allWeights* ../pops/.
    #awk -f ../weightAvgPerFileNan.awk $w > proc-${w}
    cd ..
  fi
done
cd pops


