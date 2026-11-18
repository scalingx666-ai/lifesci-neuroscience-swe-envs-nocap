# Issue

**Title:** Update checking for editable mode of spikeinterface

## Description

Moving on with. my change to imports we don't need to import spikeinterface to see if it is an editable install. 

Instead we check the metadata of the file and see that it was a 
1) a local build (ie from your git repo
2) that the install was in editable mode

if either condition fails then it is not in editable mode.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `62550b6cde63`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.