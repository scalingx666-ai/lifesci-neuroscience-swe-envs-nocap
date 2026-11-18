# Issue

**Title:** Create scout from channel

## Description

hello, 

This PR is taking a channel file (EEG or NIRS) and create a scout on the scalp at the position of the sensors. All the vertex that are near a sensor are added to the scout based on a user-specified radius.  it will save me a lot of time as I used to draw those manually :) 


This is very useful when computing fNIRS optimal montage. 

1/ To indicate to the optimal montage where are the EEG sensors and  avoid having the optimal montage suggesting to put EEG and fNIRS sensor at the same location. 

This image shows the position of the EEG in red. On the left is the optimal montage, not taking into consideration the EEG. On the right, the optimal montage takes into consideration the EEG and avoids the EEG location. 
![image](https://github.com/user-attachments/assets/56f86b29-aa6a-4eaa-8552-884c7328f323)

2/ To indicate the potential position for the fNIRS location.  
We can import a cap and convert it to scout to then use it as potential location for fNIRS optimal montage. 



The only thing left to do is to incorporate the position of the NIRS cap in brainstorm :) 
I have a tutorial almost ready for that. 

Hs: I also hide the option to compute the head model for nirs since it is not supported by this menu :) 

Edouard

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4871b89437dd`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.