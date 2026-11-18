# Issue

**Title:** DOC: Explain channel dilution in annotate_muscle_zscore

## Description

While working on CTF-275 data I found some focal muscle activity in temporal sensors, using all channels missed it in `annotate_muscle_zscore`. Only with checks and experimenting on the data / plotting PSDs that I tested using a subset of channels. Clarifying how the function could be used would hopefully help a future user not waste their time like I did x). I thought about adding `picks=` to use the function on a subset of function within one type but I think this explanation is better and simpler. 
 
Claude used to draft the docs change.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `349e64dc5b44`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.