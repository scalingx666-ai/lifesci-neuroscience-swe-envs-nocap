# Issue

**Title:** Process: Add combine recordings

## Description

Hello, 

This is the continuation of  in the attempt to enhance multimodal data analysis in Brainstorn. 

Since, having multiple raw viewer recording with multiple sampling rate is not accessible (), i made this process to combine recording and resampling them to the highest frequency. 

This allows to make such visualization directly from Brainstorm: 

![image](https://github.com/brainstorm-tools/brainstorm3/assets/24530402/83e5a6ca-867e-403e-ac04-5b4d7b341e40)

This assume that the signals were synchronized

Todo: 

- [x] User-specified folder name
- [x] Copy channel flag
- [x] Copy video if present (not necessary actually. can be loaded from the other folder)
- [x] Events are concatenated, they are channel-wise for the channels in their original file
- [x] Channel locations are merged, they are already SCS
- [x] Projectors are also merged

Question: 
~~- [x] Better way to merge channels?~~
~~I am not sure if the way I am doing is ok; especially if I need to merge headpoints / fiducials ...~~

~~- [x] How to deal with events ?~~
~~Same thing, I am only copying events from the first file ? Should we merge them adding a sufixe to the name to identify the file ?~~

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a8784a4f33e0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.