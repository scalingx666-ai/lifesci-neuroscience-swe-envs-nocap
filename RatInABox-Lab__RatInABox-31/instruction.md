# Issue

**Title:** Merge dev into 1.x

## Description

Lots of changes 

* Generalised value function to multidimensional rewards 
* Default figure formatting and saving functions
* Animations show inline on jupyter 
* Optional interpolation of trajectories when imported 
* save_history() option
* reset_history() option 
* curved environments 
* plotting bug fixes or make defaults look pretties 
* Objects inherent to environment (Env.add_object()), OVCs read off these 
* FieldOfViewNeurons class for egocentric representations !!
* Trajectories can be coloured by time 
* Lots of smaller bug fixes

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `bd35431fcd00`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.