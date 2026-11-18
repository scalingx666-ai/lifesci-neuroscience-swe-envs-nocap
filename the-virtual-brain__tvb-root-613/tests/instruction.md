# Issue

**Title:** TVB-3040. Fix siibra creator

## Description

It appears that the siibra creator page works only with the default values. 
After investigations, the other atlases/parellations either don't have any data for the connectivity creation, or they are not compliant with the current siibra API. 
So, for the moment, only the default atlas and parcellation are given as options in web GUI.
All siibra atlases can still be used from the command line api, and we will expose them back in the web, when siibra/KG will have data.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9d525df00faf`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.