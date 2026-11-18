# Issue

**Title:** Fix for /tmp/ being used when -w is set

## Description

#40 Potential fix to problem number 2 (currently testing, the changes need to be made regardless). But these needed to be fixed from last merge regarding working directory. 

The three instances in base.py were creating pre_conf, denoise, and connectivity directories in /tmp/fmridenoise/ and that have been creating the problem I was facing where /tmp/ was still partially being used. 

I've also had to change utils/temps to make the argument `name` be the entire path, not `/tmp/fmridenoise/<name>`  (that was the problem)

(Don't merge yet! 2 changes need to be made)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c9f59b3698b7`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.