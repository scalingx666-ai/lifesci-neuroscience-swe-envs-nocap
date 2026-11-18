# Issue

**Title:** [filter] replace zero padding with constant padding

## Description

Hello, 

For a long time, our lab had an issue with a transient effect after our preprocessing pipeline on all-night data (9 hours); I finally took the time to investigate and found it was due to the padding done during filtering. See because we are having such long data; the drift is quite large from the beginning to the end of the night; and therefore; even if the mean of the signal is removed; padding the signal with zero is creating a huge discontinuity at the beginning and end of the signal before applying the filter; cause the presence of a large transient effect (at the beginning and end of the signal). 

By replacing this constant padding of 0 with a constant padding adapted to the first/last value of the signal, we avoid this effect. 

I believe this will have very little effect on other data (as the padding will be close to 0) but will help a lot in our case. 



**Before:** 

<img width="590" height="468" alt="image" src="https://github.com/user-attachments/assets/bd12e8fc-64dc-4531-a5fc-bc705f9787d9" />



**After:** 

<img width="590" height="468" alt="image" src="https://github.com/user-attachments/assets/7f40acb8-3fb9-4016-bd11-ec576f88f8a5" />



Filter specification: 

<img width="478" height="527" alt="image" src="https://github.com/user-attachments/assets/fb9d5405-47d6-41c0-a503-3c1fa0fc5840" />


<img width="563" height="490" alt="image" src="https://github.com/user-attachments/assets/fec76f44-acd4-47c8-882e-c96306740c4b" />


Note: i tried to apply a linear detrend before the filter; but it makes things even worse. So i think this PR is really the best solution :)


Thanks a lot, 
Edouard

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ff2780e66102`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.