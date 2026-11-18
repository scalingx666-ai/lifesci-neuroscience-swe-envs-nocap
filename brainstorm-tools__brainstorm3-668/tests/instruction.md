# Issue

**Title:** [Bug fix] Surface Smoothing

## Description

As I was working on  , I found this small bug. sorry for not having caught it before. 

Also, If we want to speed up a bit the computation of the smoothing kernel in tess_smooth_sources,  we can add 
```Dist(Dist > 10* Sigma) = 0 ```

https://github.com/brainstorm-tools/brainstorm3/blob/master/toolbox/anatomy/tess_smooth_sources.m#L67

I guess this would be ok; since the value of the kernel for any distance larger than 10 sigma is in the order of 10^-20.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a145a4fb743f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.