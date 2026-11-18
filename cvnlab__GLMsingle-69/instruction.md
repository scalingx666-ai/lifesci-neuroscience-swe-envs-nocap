# Issue

**Title:** Fixes two errors when using picksubset

## Description

Hello,

I fixed two bugs that came up when using `picksubset`. This PR should solve #63 and #68. 
The fixes are 
 1. defining the array that is being used for indexing in `picksubset` as integer (line 38).
 2. Using only the first return argument of `picksubset` in `findtailthreshold` (line 52).

The rest of the diffs is because my .vimrc is set up in a way that deletes obsolete whitespace when writing a python file. I have to admit that I am a bit puzzled about these bugs because they are not depending on the file input and make me believe that those parts of the code has never been actually run. Otherwise they would have shown up.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e2faa1c530ef`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.