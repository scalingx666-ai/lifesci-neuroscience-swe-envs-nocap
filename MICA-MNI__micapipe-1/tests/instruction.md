# Issue

**Title:** Init

## Description

I've added the init file. It does the following things:

- Dynamically set the temporary directory depending on the host.
- Prepends all paths to the existing path.
- Stores the old path for resetting the path later. 
- Determines the number of cores to use. Priority is given to SGE's $NSLOTS. If that doesn't exist it defaults to the user local_threads. 

Unfortunately I couldn't completely clear the path as this also clears system libraries (e.g. `uname`). So instead I've just prepended the additional paths and set a trap to return the path to normal after exit/termination/interrupt. It doesn't completely prevent interference from other scripts on the path, but its probably good enough. 

The comments in the init file occasionally say "Uncomment this..". I've not actually commented the following lines for MICA usage, but for publication I recommend we do. 

I've also modified the mica-pipe file by adding a sourcing of the init file and a trap that lets us reset the modified PATH.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ac778b7ac249`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.