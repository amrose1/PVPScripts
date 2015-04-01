# PVPScripts
scripts for testing PVP code on GridEngine

-Scripts labeled by number run a specific set of model parameters
-run* scripts are for running certain numbered scripts
-scripts assume you are on a cluster running GridEngine

To run your code:
- These run scripts must be in the mason folder
- There must be a results folder at the same level as the mason folder
- Code must be in mason/sim/app/[package name]
- Code must already be compiled
- modify runparamsall.sh with name of results folder, alpha, gamma, epsilon (if relevant)
- run the scripts by typing "./runparamsall.sh" from the mason folder

To analyze results from your experiments:
- Verify that all of your jobs have finished by typing "qstat". There should be nothing running with your username linked to it.
- Go to results folder (~/results, probably)
- Run process.sh
- all results summary files are in pops directory. You will want to scp them to your own computer to analyze further.
- move all folders created from your experiments from the results folder to a folder named "processed" which is in (~/processed)

****Do not delete your results files, as we will need to keep them as experimental data
