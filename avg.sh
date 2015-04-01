# Preprocess files to make sure they are all up to time 5000
for f in *.csv
do
  cp $f $f-proc
  length=`tail -n 1 $f | awk -F, '{print $1}'`
  ((length=length+10))
  if [ $length -lt 5000 ]
  then
    for i in `seq $length 10 5000`
    do
      echo "$i,0,0,0,0,0,0,0,0,0,0,0" >> $f-proc
    done
  fi
done

# Combine all files, taking the average of the three adjacent columns
paste -d, *.csv-proc |  awk -F ',' '
{
  numCols=12
  if (NR!=1) {
    # Sum for mean calculation
    sumPrey=0
    sumPred=0
    sumFood=0
    # Sum of squares for standard deviation calculation
    sumPreySQ=0
    sumPredSQ=0
    sumFoodSQ=0
    # Number of files (should have 12 * numFiels columns total)
    numFiles=0
    for (i=2; i < NF; i=i+numCols) {
      sumPrey=sumPrey+$(i)
      sumPreySQ=sumPreySQ+$(i)*$(i)
      sumPred=sumPred+$(i+1)
      sumPredSQ=sumPredSQ+$(i+1)*$(i+1)
      sumFood=sumFood+$(i+2)
      sumFoodSQ=sumFoodSQ+$(i+2)*$(i+2)
      numFiles++
    }
    # Calculate Standard Deviations
    stdDevPrey=sqrt(sumPreySQ/numFiles - (sumPrey/numFiles)**2)
    stdDevPred=sqrt(sumPredSQ/numFiles - (sumPred/numFiles)**2)
    stdDevFood=sqrt(sumFoodSQ/numFiles - (sumFood/numFiles)**2)

    print (10*(NR-2)) ", " sumPrey/numFiles ", " sumPred/numFiles ", " sumFood/numFiles \
      ", " stdDevPrey ", " stdDevPred ", " stdDevFood
  }

}'
