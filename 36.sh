#! /bin/bash
path=sim/app/PVPLearn
outdir=~/emotions/results/$1
file="50-50-$2-$3-1-1600-200-3000-0-0.01-12-12-0.1-0.01-15-15-0.05-1.5-1.5-5000-$4-$5-$6-"
param="50 50 $2 $3 1 1600 200 3000 0 0.01 12 12 0.1 0.01 15 15 0.05 1.5 1.5 $4 $5 $6 $outdir/$7" 
declare -a seeds=(1000 4568932 1122111 56789321456 789 96321458 147147 9658 8978 25646 321321321 20166 9057666 2020306 880990771)

mkdir $outdir

for i in {0..14}
do
echo $outdir/prob${seeds[i]}.txt -e $outdir/err${seeds[i]}.txt java -ea $path/PVP_2 $outdir $file${seeds[i]} $param-${seeds[i]} -until 5000 -seed ${seeds[i]}
qsub -l vf=12G -b y -cwd -o $outdir/prob1${seeds[i]}.txt -e $outdir/err${seeds[i]}.txt java -ea $path/PVP_2 $outdir $file${seeds[i]} $param-${seeds[i]} -until 5000 -seed ${seeds[i]}
done
