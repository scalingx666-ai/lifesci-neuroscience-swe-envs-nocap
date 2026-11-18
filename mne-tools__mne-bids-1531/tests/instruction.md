# Issue

**Title:** FIX: Write text files with utf-8 encoding instead of utf-8-sig

## Description

cc @sappelhoff @hoechenberger 

~~Hope you don't mind that I added 2 new constants to `config.py`. I think this makes the code intent clearer and will make updating these encodings easier in the future.~~

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `bdb2ad761898`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.