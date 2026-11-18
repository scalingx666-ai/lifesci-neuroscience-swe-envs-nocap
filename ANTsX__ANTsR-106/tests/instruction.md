# Issue

**Title:** Modified abpBrainExtraction and antsRegistration to improve skull stripping

## Description

abpBrainExtraction has a new option (temregmask) to pass a registration mask (skull-but-no-face) which improves registration. Both initialization and later warps will use this mask.
abpBrainExtraction has a new option (regtype) which allows the user to select the type of registration performed on the template. Defaul is same as before (SyN) but a new option (SyNabp) allows to match completely the shell version `antsBrainExtraction.sh`
Some lines that were not used in abpBrainExtraction are commented out, so coders don't get confused by ghost code.
antsRegistration has a new option (SyNabp) that matches one on one the parameters used by the shell script (antsBrainExtraction).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b1e3968cbd2d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.