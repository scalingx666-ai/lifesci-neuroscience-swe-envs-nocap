# Issue

**Title:** FIX  potential qsubget filesystem latency issue

## Description

Check output file presence after job completion to handle file system latency. I believe this may prevent latency issues in `qsubget`, which is also supported by the comment in there (but which was not guaranteed):

>   if qsublist('completed', jobid)
    % the job has completed and the output file exist

I think `qsubcellfun` suffered from this in particular, because in there it checks `argout`, which can sometimes be empty due to filesystem latency

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c49e6578598c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.