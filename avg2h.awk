#!/bin/awk
# Go through each processed csv output file and find the averages down the columns
# Print out the averages per column on a single line
# Only data before one population is zero is included in average
# Also tracks how many timesteps the ecosystem survived
#THIS version of the script works on files where hunger and eatCount is output
BEGIN{
	FS=","
	for(x=0; x<15; x=x+1)
	{
		count[x]=0
		#used to find average of each column of each file
		sumPrey[x]=0
		sumPred[x]=0
		sumOutran[x]=0
		sumCaught[x]=0
		sumPreyStay[x]=0
		sumPredStay[x]=0
		sumPreyH[x]=0
		sumPredH[x]=0
		sumPreyE[x]=0
		#standard deviations of above 4 averages
		sumPreySD[x]=0
		sumPredSD[x]=0
		sumOutranSD[x]=0
		sumCaughtSD[x]=0
		sumPreyStaySD[x]=0
		sumPredStaySD[x]=0
		sumPreyHSD[x]=0
		sumPredHSD[x]=0
		sumPreyESD[x]=0
		#first timestep in which one species is 0
		ending[x]=5000
	}
    numCols=15
}
{
	k=0 
	if (NR!=1) {
		#each file is now a set of 12 columns in one file
		#for each file, find the sum of values in each relevant col of current row
   		 for (i=7; i < NF; i=i+numCols) {
			#columns 2 and 3 hold the number of prey & predators
      			if($(i-5)!=0 && $(i-4)!=0){
				#add column value to each running sum
				sumPrey[k]=sumPrey[k]+$(i-5)
				sumPred[k]=sumPred[k]+$(i-4)
				sumOutran[k]=sumOutran[k]+$(i)
				sumCaught[k]=sumCaught[k]+$(i+3)
				sumPreyStay[k]=sumPreyStay[k]+$(i+4)
				sumPredStay[k]=sumPredStay[k]+$(i+5)
				sumPreyE[k]=sumPreyE[k]+$(i+6)
				sumPreyH[k]=sumPreyH[k]+$(i+7)
				sumPredH[k]=sumPredH[k]+$(i+8)
				#add column value squared to stdev running sum
				sumPreySD[k]=sumPreySD[k]+$(i-5)*$(i-5)
				sumPredSD[k]=sumPredSD[k]+$(i-4)*$(i-4)
				sumOutranSD[k]=sumOutranSD[k]+$(i)*$(i)
				sumCaughtSD[k]=sumCaughtSD[k]+$(i+3)*$(i+3)
				sumPreyStaySD[k]=sumPreyStaySD[k]+$(i+4)*$(i+4)
				sumPredStaySD[k]=sumPredStaySD[k]+$(i+5)*$(i+5)
				sumPreyESD[k]=sumPreyESD[k]+$(i+6)*$(i+6)
				sumPreyHSD[k]=sumPreyHSD[k]+$(i+7)*$(i+7)
				sumPredHSD[k]=sumPredHSD[k]+$(i+8)*$(i+8)
				#count how many values have been added in
				count[k]=count[k]+1
			}
			else if(ending[k]==5000){ #prey or pred is 0, and this is first row like that
				ending[k]=$(i-6)
			}
			k=k+1
   		 }
	}
}
END{
    print "index,predOutran,preyCaught,preyStay,predStay,endingTime,prey,pred,preyEat,preyHunger,predHunger"
	for (i=0; i < 15; i=i+1) {
		#find average
		sumOutran[i]=sumOutran[i]/count[i]
		sumCaught[i]=sumCaught[i]/count[i]
		sumPreyStay[i]=sumPreyStay[i]/count[i]
		sumPredStay[i]=sumPredStay[i]/count[i]
		sumPrey[i]=sumPrey[i]/count[i]
		sumPred[i]=sumPred[i]/count[i]
		sumPreyE[i]=sumPreyE[i]/count[i]
		sumPreyH[i]=sumPreyH[i]/count[i]
		sumPredH[i]=sumPredH[i]/count[i]
		#find standard deviation using average from above
		sumOutranSD[i]=sqrt(sumOutranSD[i]/count[i]-(sumOutran[i])**2)
		sumCaughtSD[i]=sqrt(sumCaughtSD[i]/count[i]-(sumCaught[i])**2)
		sumPreyStaySD[i]=sqrt(sumPreyStaySD[i]/count[i]-(sumPreyStay[i])**2)
		sumPredStaySD[i]=sqrt(sumPredStaySD[i]/count[i]-(sumPredStay[i])**2)
		sumPreySD[i]=sqrt(sumPreySD[i]/count[i]-sumPrey[i]**2)
		sumPredSD[i]=sqrt(sumPredSD[i]/count[i]-sumPred[i]**2)
		sumPreyESD[i]=sqrt(sumPreyESD[i]/count[i]-sumPreyE[i]**2)
		sumPreyHSD[i]=sqrt(sumPreyHSD[i]/count[i]-sumPreyH[i]**2)
		sumPredHSD[i]=sqrt(sumPredHSD[i]/count[i]-sumPredH[i]**2)
		#print results
		print i "," sumOutran[i] "," sumCaught[i] "," sumPreyStay[i] "," sumPredStay[i] "," ending[i] \
		"," sumPrey[i] "," sumPred[i] "," sumPreyE[i] "," sumPreyH[i] "," sumPredH[i] ","  sumOutranSD[i] \
		"," sumCaughtSD[i] "," sumPreyStaySD[i] "," sumPredStaySD[i] "," sumPreySD[i] "," sumPredSD[i]\
		"," sumPreyESD[i] "," sumPreyHSD[i] "," sumPredHSD[i]
	}
}
