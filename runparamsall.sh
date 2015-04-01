#!/bin/bash

#each runparams scripts has sets of experiments to run, grouped into sets: 1,2,3,4
#run each script for every set of runs. Remove one from list to ignore those runs

for i in 1 2 3 4 
do
	#script run_sets nameOfResults alpha gamma epsilon weight_output
	./runparamsX.sh $i w3T 0.05 1 0.01 weight
	./runparamsY.sh $i w3T 0.05 1 0.01 weight
	./runparamsL.sh $i w3T 0.05 1 0.01 weight
#	./runparamsNone.sh $i non 1 1 1 none
done
