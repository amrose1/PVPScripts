#!/bin/bash
n=$2
p1=$3
p2=$4
p3=$5
o=$6
if [ $1 -eq "1" ]
then
#run scripts for many parameters
for i in {1..8}
do
	./${i}.sh ${n}${i} false false $p1 $p2 $p3 unused >  ../${n}${i}
#	./${i}.sh ${n}${i}x true false $p1 $p2 $p3 ${o}${i}x >   ../${n}${i}x
#	./${i}.sh ${n}${i}y false true  $p1 $p2 $p3 ${o}${i}y >  ../${n}${i}y
#	./${i}.sh ${n}${i}l true true  $p1 $p2 $p3 ${o}${i}l >  ../${n}${i}l
done
fi

#for 10 and 11
if [ $1 -eq "2" ]
then
./10.sh ${n}9 false false  $p1 $p2 $p3 unused >  ../${n}9
#./10.sh ${n}9x true false  $p1 $p2 $p3 ${o}9x >  ../${n}9x
#./10.sh ${n}9y false true  $p1 $p2 $p3 ${o}9y >  ../${n}9y
#./10.sh ${n}9l true true  $p1 $p2 $p3 ${o}9l >  ../${n}9l
./11.sh ${n}10 false false  $p1 $p2 $p3 unused >  ../${n}10
#./11.sh ${n}10x true false  $p1 $p2 $p3 ${o}10x >  ../${n}10x
#./11.sh ${n}10y false true  $p1 $p2 $p3 ${o}10y >  ../${n}10y
#./11.sh ${n}10l true true  $p1 $p2 $p3 ${o}10l >  ../${n}10l
fi

#for 11 to 22
if [ $1 -eq "3" ]
then
let b=10
for i in {21..32}
do
	let k=$i-b
	./${i}.sh ${n}${k} false false $p1 $p2 $p3 unused >  ../${n}${k}
#	./${i}.sh ${n}${k}x true false $p1 $p2 $p3 ${o}${k}x >  ../${n}${k}x
#	./${i}.sh ${n}${k}y false true $p1 $p2 $p3 ${o}${k}y >  ../${n}${k}y
#	./${i}.sh ${n}${k}l true true $p1 $p2 $p3 ${o}${k}l >  ../${n}${k}l
done
fi

#for 22-25
if [ $1 -eq "4" ]
then
let b=11
for i in {34..36}
do
	let k=$i-b
	./${i}.sh ${n}${k} false false  $p1 $p2 $p3 unused >  ../${n}${k}
#	./${i}.sh ${n}${k}x true false  $p1 $p2 $p3 ${o}${k}x >  ../${n}${k}x
#	./${i}.sh ${n}${k}y false true $p1 $p2 $p3 ${o}${k}y >  ../${n}${k}y
#	./${i}.sh ${n}${k}l true true  $p1 $p2 $p3 ${o}${k}l >  ../${n}${k}l
done
fi
