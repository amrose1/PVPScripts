#!/bin/awk
#Go through a file of averages and find the average of each column
BEGIN{
	FS=","
	count=0
	sumOutran=0
	sumCaught=0
	sumPreyStay=0
	sumPredStay=0
	sumPrey=0
	sumPred=0
	sumPreyE=0
	sumPreyH=0
	sumPredH=0
	sdPreyE=0
	sdPreyH=0
	sdPredH=0
	sdPrey=0
	sdPred=0
	sdOutran=0
	sdCaught=0
	sdPreyStay=0
	sdPredStay=0
	ending=0
	sdending=0
}
{
if (NR!=1) {
	#sum values by column
       sumOutran=sumOutran+$2
	sumCaught=sumCaught+$3
	sumPreyStay=sumPreyStay+$4
	sumPredStay=sumPredStay+$5
        ending=ending+$6
	sumPrey=sumPrey+$7
	sumPred=sumPred+$8
	sumPreyE=sumPreyE+$9
	sumPreyH=sumPreyH+$10
	sumPredH=sumPredH+$11
       #calculate standard deviation by adding square of value
	sdOutran=sdOutran+$2*$2
	sdCaught=sdCaught+$3*$3
	sdPreyStay=sdPreyStay+$4*$4
	sdPredStay=sdPredStay+$5*$5
        sdending=sdending+$6*$6
	sdPrey=sdPrey+$7*$7
	sdPred=sdPred+$8*$8
	sdPreyE=sdPreyE+$9*$9
	sdPreyH=sdPreyH+$10*$10
	sdPredH=sdPredH+$11*$11
	count=count+1
 }
}
END{
    sumOutran=sumOutran/count
	sumCaught=sumCaught/count
	sumPreyStay=sumPreyStay/count
	sumPredStay=sumPredStay/count
	sumPrey=sumPrey/count
	sumPred=sumPred/count
	sumPreyE=sumPreyE/count
	sumPreyH=sumPreyH/count
	sumPredH=sumPredH/count
	ending=ending/count
	#calculate standard deviation using above averages
	sdCaught=sqrt(sdCaught/count-sumCaught**2)
	sdPreyStay=sqrt(sdPreyStay/count-sumPreyStay**2)
	sdPredStay=sqrt(sdPredStay/count-sumPredStay**2)
	sdending=sqrt(sdending/count-ending**2)
	sdOutran=sqrt(sdOutran/count-sumOutran**2)
	sdPrey=sqrt(sdPrey/count-sumPrey**2)
	sdPred=sqrt(sdPred/count-sumPred**2)
	sdPreyE=sqrt(sdPreyE/count-sumPreyE**2)
	sdPreyH=sqrt(sdPreyH/count-sumPreyH**2)
	sdPredH=sqrt(sdPredH/count-sumPredH**2)
	#print results
	print "average, " sumOutran ", " sumCaught ", " sumPreyStay ", " sumPredStay ", " ending \
	"," sumPrey "," sumPred "," sumPreyE "," sumPreyH "," sumPredH "," sdOutran "," sdCaught \
	"," sdPreyStay "," sdPredStay "," sdending "," sdPrey "," sdPred "," sdPreyE "," sdPreyH \
	"," sdPredH
}
