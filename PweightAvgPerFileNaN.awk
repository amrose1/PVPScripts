#!/bin/awk
# Go through the weight output and find the average of each weight for a given time of output
#assumes at most 11 time periods
function abs(x){return ((x<0.0) ? -x : x)}
BEGIN{
	#count lets us know how many values were read in
	#indices are in this order: prey and predator counts, for each time period in order
	#assumes 11 time groups max
	for(y=2; y<24; y++)
	{
		count[y]=0
	}	
	#each index refers to a feature
	#prey features are first, follwed by predator features
	#one array per time period output
	for(x=0; x<24; x=x+1)
	{
		weight1[x]=0
		weight2[x]=0
		weight3[x]=0
		weight4[x]=0
		weight5[x]=0
		weight6[x]=0
		weight7[x]=0
		weight8[x]=0
		weight9[x]=0
		weight10[x]=0
		weight11[x]=0
		weight1SD[x]=0
		weight2SD[x]=0
		weight3SD[x]=0
		weight4SD[x]=0
		weight5SD[x]=0
		weight6SD[x]=0
		weight7SD[x]=0
		weight8SD[x]=0
		weight9SD[x]=0
		weight10SD[x]=0
		weight11SD[x]=0
		nan1[x]=0
		nan2[x]=0
		nan3[x]=0
		nan4[x]=0
		nan5[x]=0
		nan6[x]=0
		nan7[x]=0
		nan8[x]=0
		nan9[x]=0
		nan10[x]=0
		nan11[x]=0
	}
    time=30
}
{
	#First field is time, second is agent ID, next 12 are weights

	#find count index
	off=($1-210)/time+1
	off = (off)*2
	if(substr($2,1,1)=="R") { #PREY
		j=0 #amount to offset index
	}
	else {
		j=12
		off = off +1
	}
	count[off]=count[off]+1

	#add weight values to correct weight array and index
	when = ($1-210)/time+1
	if(when == 1)
	{
		for(i=3; i<NF; i++)
		{
			k=i-3+j #correct array index based on pred or prey, pred follows prey list
			if($i== "NaN")
				nan1[k]=nan1[k]+1
			else{
				weight1[k]=weight1[k]+$i		
				weight1SD[k]=weight1SD[k]+$(i)*$(i)
			}
		}
	}
	else if(when == 2)
	{
		for(i=3; i<NF; i++)
		{
			k=i-3+j #correct based on pred or prey, pred follows prey list
			if($i== "NaN")
				nan2[k]=nan2[k]+1
			else{
				weight2[k]=weight2[k]+$i		
				weight2SD[k]=weight2SD[k]+$(i)*$(i)
			}
		}
	}
	else if(when == 3)
	{
		for(i=3; i<NF; i++)
		{
			k=i-3+j #correct based on pred or prey, pred follows prey list
			if($i== "NaN")
				nan3[k]=nan3[k]+1
			else{
				weight3[k]=weight3[k]+$i		
				weight3SD[k]=weight3SD[k]+$(i)*$(i)
			}
		}
	}
	else if(when == 4)
	{
		for(i=3; i<NF; i++)
		{
			k=i-3+j #correct based on pred or prey, pred follows prey list
			if($i== "NaN")
				nan4[k]=nan4[k]+1
			else{
				weight4[k]=weight4[k]+$i		
				weight4SD[k]=weight4SD[k]+$(i)*$(i)
			}
		}
	}
	else if(when == 5)
	{
		for(i=3; i<NF; i++)
		{
			k=i-3+j #correct based on pred or prey, pred follows prey list
			if($i== "NaN")
				nan5[k]=nan5[k]+1
			else{
				weight5[k]=weight5[k]+$i		
				weight5SD[k]=weight5SD[k]+$(i)*$(i)
			}
		}
	}
	else if(when == 6)
	{
		for(i=3; i<NF; i++)
		{
			k=i-3+j #correct based on pred or prey, pred follows prey list
			if($i== "NaN")
				nan6[k]=nan6[k]+1
			else{
				weight6[k]=weight6[k]+$i		
				weight6SD[k]=weight6SD[k]+$(i)*$(i)
			}
		}
	}
	else if(when == 7)
	{
		for(i=3; i<NF; i++)
		{
			k=i-3+j #correct based on pred or prey, pred follows prey list
			if($i== "NaN")
				nan7[k]=nan7[k]+1
			else{
				weight7[k]=weight7[k]+$i		
				weight7SD[k]=weight7SD[k]+$(i)*$(i)
			}
		}
	}
	else if(when == 8)
	{
		for(i=3; i<NF; i++)
		{
			k=i-3+j #correct based on pred or prey, pred follows prey list
			if($i== "NaN")
				nan8[k]=nan8[k]+1
			else{
				weight8[k]=weight8[k]+$i		
				weight8SD[k]=weight8SD[k]+$(i)*$(i)
			}
		}
	}
	else if(when == 9)
	{
		for(i=3; i<NF; i++)
		{
			k=i-3+j #correct based on pred or prey, pred follows prey list
			if($i== "NaN")
				nan9[k]=nan9[k]+1
			else{
				weight9[k]=weight9[k]+$i		
				weight9SD[k]=weight9SD[k]+$(i)*$(i)
			}
		}
	}
	else if(when == 10)
	{
		for(i=3; i<NF; i++)
		{
			k=i-3+j #correct based on pred or prey, pred follows prey list
			if($i== "NaN")
				nan10[k]=nan10[k]+1
			else{
				weight10[k]=weight10[k]+$i		
				weight10SD[k]=weight10SD[k]+$(i)*$(i)
			}
		}
	}
	else if(when == 11)
	{
		for(i=3; i<NF; i++)
		{
			k=i-3+j #correct based on pred or prey, pred follows prey list
			if($i== "NaN")
				nan11[k]=nan11[k]+1
			else{
				weight11[k]=weight11[k]+$i		
				weight11SD[k]=weight11SD[k]+$(i)*$(i)
			}
		}
	}
	

}
END{
	k=0
	for (i=0; i < 12; i=i+1) {
		#k is index for predator
		k=i+12
		#find average, prey then predator, for each time period set
		if(count[2]-nan1[i]>0){
			weight1[i]=weight1[i]/(count[2]-nan1[i])
			weight1SD[i]=sqrt(abs(weight1SD[i]/(count[2]-nan1[i])-(weight1[i])**2))
		}if(count[3]-nan1[k] >0){
			weight1[k]=weight1[k]/(count[3]-nan1[k])
			weight1SD[k]=sqrt(abs(weight1SD[k]/(count[3]-nan1[k])-(weight1[k])**2))
		}if(count[4]-nan2[i]>0){
			weight2[i]=weight2[i]/(count[4]-nan2[i])
			weight2SD[i]=sqrt(abs(weight2SD[i]/(count[4]-nan2[i])-(weight2[i])**2))
		}if(count[5]-nan2[k]>0){
			weight2[k]=weight2[k]/(count[5]-nan2[k])
			weight2SD[k]=sqrt(abs(weight2SD[k]/(count[5]-nan2[k])-(weight2[k])**2))
		}if(count[6]-nan3[i]>0){
			weight3[i]=weight3[i]/(count[6]-nan3[i])
			weight3SD[i]=sqrt(abs(weight3SD[i]/(count[6]-nan3[i])-(weight3[i])**2))
		}if(count[7]-nan3[k]>0){
			weight3[k]=weight3[k]/(count[7]-nan3[k])
			weight3SD[k]=sqrt(abs(weight3SD[k]/(count[7]-nan3[k])-(weight3[k])**2))
		}if(count[8]-nan4[i]>0){
			weight4[i]=weight4[i]/(count[8]-nan4[i])
			weight4SD[i]=sqrt(abs(weight4SD[i]/(count[8]-nan4[i])-(weight4[i])**2))
		}if(count[9]-nan4[k]>0){
			weight4[k]=weight4[k]/(count[9]-nan4[k])
			weight4SD[k]=sqrt(abs(weight4SD[k]/(count[9]-nan4[k])-(weight4[k])**2))
		}if(count[10]-nan5[i]>0){
			weight5[i]=weight5[i]/(count[10]-nan5[i])
			weight5SD[i]=sqrt(abs(weight5SD[i]/(count[10]-nan5[i])-(weight5[i])**2))
		}if(count[11]-nan5[k]>0){
			weight5[k]=weight5[k]/(count[11]-nan5[k])
			weight5SD[k]=sqrt(abs(weight5SD[k]/(count[11]-nan5[k])-(weight5[k])**2))
		}if(count[12]-nan6[i]>0){
			weight6[i]=weight6[i]/(count[12]-nan6[i])
			weight6SD[i]=sqrt(abs(weight6SD[i]/(count[12]-nan6[i])-(weight6[i])**2))
		}if(count[13]-nan6[k]>0){
			weight6[k]=weight6[k]/(count[13]-nan6[k])
			weight6SD[k]=sqrt(abs(weight6SD[k]/(count[13]-nan6[k])-(weight6[k])**2))
		}if(count[14]-nan7[i]>0){
			weight7[i]=weight7[i]/(count[14]-nan7[i])
			weight7SD[i]=sqrt(abs(weight7SD[i]/(count[14]-nan7[i])-(weight7[i])**2))
		}if(count[15]-nan7[k]>0){
			weight7[k]=weight7[k]/(count[15]-nan7[k])
			weight7SD[k]=sqrt(abs(weight7SD[k]/(count[15]-nan7[k])-(weight7[k])**2))
		}if(count[16]-nan8[i]>0){
			weight8[i]=weight8[i]/(count[16]-nan8[i])
			weight8SD[i]=sqrt(abs(weight8SD[i]/(count[16]-nan8[i])-(weight8[i])**2))
		}if(count[17]-nan8[k]>0){
			weight8[k]=weight8[k]/(count[17]-nan8[k])
			weight8SD[k]=sqrt(abs(weight8SD[k]/(count[17]-nan8[k])-(weight8[k])**2))
		}if(count[18]-nan9[i]>0){
			weight9[i]=weight9[i]/(count[18]-nan9[i])
			weight9SD[i]=sqrt(abs(weight9SD[i]/(count[18]-nan9[i])-(weight9[i])**2))
		}if(count[19]-nan9[k]>0){
			weight9[k]=weight9[k]/(count[19]-nan9[k])
			weight9SD[k]=sqrt(abs(weight9SD[k]/(count[19]-nan9[k])-(weight9[k])**2))
		}if(count[20]-nan10[i]>0){
			weight10[i]=weight10[i]/(count[20]-nan10[i])
			weight10SD[i]=sqrt(abs(weight10SD[i]/(count[20]-nan10[i])-(weight10[i])**2))
		}if(count[21]-nan10[k]>0){
			weight10[k]=weight10[k]/(count[21]-nan10[k])
			weight10SD[k]=sqrt(abs(weight10SD[k]/(count[21]-nan10[k])-(weight10[k])**2))
		}if(count[22]-nan11[i]>0){
			weight11[i]=weight11[i]/(count[22]-nan11[i])
			weight11SD[i]=sqrt(abs(weight11SD[i]/(count[22]-nan11[i])-(weight11[i])**2))
		}if(count[23]-nan11[k]>0){
			weight11[k]=weight11[k]/(count[23]-nan11[k])
			weight11SD[k]=sqrt(abs(weight11SD[k]/(count[23]-nan11[k])-(weight11[k])**2))
		}
	}
	
	#print results
	for(x=2; x<24; x=x+1){
		printf "%f,",count[x]
	}
	print ""
	for(x=0; x<24; x=x+1){
		printf "%f,",weight1[x]
	}
	for(x=0; x<24; x=x+1){
		printf "%f,",weight1SD[x]
	}
	for(x=0; x<24; x=x+1){
		printf "%f,",nan1[x]
	}
	print ""
	for(x=0; x<24; x=x+1){
		printf "%f,",weight2[x]
	}
	for(x=0; x<24; x=x+1){
		printf "%f,",weight2SD[x]
	}
	for(x=0; x<24; x=x+1){
		printf "%f,",nan2[x]
	}
	print ""
	for(x=0; x<24; x=x+1){
		printf "%f,",weight3[x]
	}
	for(x=0; x<24; x=x+1){
		printf "%f,",weight3SD[x]
	}
	for(x=0; x<24; x=x+1){
		printf "%f,",nan3[x]
	}
	print ""
	for(x=0; x<24; x=x+1){
		printf "%f,",weight4[x]
	}
	for(x=0; x<24; x=x+1){
		printf "%f,",weight4SD[x]
	}
	for(x=0; x<24; x=x+1){
		printf "%f,",nan4[x]
	}
	print ""
	for(x=0; x<24; x=x+1){
		printf "%f,",weight5[x]
	}
	for(x=0; x<24; x=x+1){
		printf "%f,",weight5SD[x]
	}
	for(x=0; x<24; x=x+1){
		printf "%f,",nan5[x]
	}
	print ""
	for(x=0; x<24; x=x+1){
		printf "%f,",weight6[x]
	}
	for(x=0; x<24; x=x+1){
		printf "%f,",weight6SD[x]
	}
	for(x=0; x<24; x=x+1){
		printf "%f,",nan6[x]
	}
	print ""
	for(x=0; x<24; x=x+1){
		printf "%f,",weight7[x]
	}
	for(x=0; x<24; x=x+1){
		printf "%f,",weight7SD[x]
	}
	for(x=0; x<24; x=x+1){
		printf "%f,",nan7[x]
	}
	print ""
	for(x=0; x<24; x=x+1){
		printf "%f,",weight8[x]
	}
	for(x=0; x<24; x=x+1){
		printf "%f,",weight8SD[x]
	}
	for(x=0; x<24; x=x+1){
		printf "%f,",nan8[x]
	}
	print ""
	for(x=0; x<24; x=x+1){
		printf "%f,",weight9[x]
	}
	for(x=0; x<24; x=x+1){
		printf "%f,",weight9SD[x]
	}
	for(x=0; x<24; x=x+1){
		printf "%f,",nan9[x]
	}
	print ""
	for(x=0; x<24; x=x+1){
		printf "%f,",weight10[x]
	}
	for(x=0; x<24; x=x+1){
		printf "%f,",weight10SD[x]
	}
	for(x=0; x<24; x=x+1){
		printf "%f,",nan10[x]
	}
	print ""
	for(x=0; x<24; x=x+1){
		printf "%f,",weight11[x]
	}
	for(x=0; x<24; x=x+1){
		printf "%f,",weight11SD[x]
	}
	for(x=0; x<24; x=x+1){
		printf "%f,",nan11[x]
	}
	print ""
}
