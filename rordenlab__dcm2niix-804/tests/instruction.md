# Issue

**Title:** GE UHP/7T Diffusion SliceTiming Update

## Description

Update code to include the UserData15 = 1.0 as well as 0.5 after checking GE PSD epi2.e code 

from
```
If (UHP or 7T) && (0.5 < UserData15 <1)
    diffCyclingModeGE = 0 (off)
```

To 
```
If (UHP or 7T) && (0.5 <= UserData15 <= 1.0)
    diffCyclingModeGE = 0 (off)
```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f8baa94756de`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.