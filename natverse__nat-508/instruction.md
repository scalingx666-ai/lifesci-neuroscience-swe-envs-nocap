# Issue

**Title:** Change rgl.* calls to *3d

## Description

Some upcoming changes to the rgl package will require changes to nat. 
I will be deprecating a number of rgl.* function calls.  You can read 
about the issues here:

   https://dmurdoch.github.io/rgl/articles/deprecation.html

I have made the required changes in the attached patches.  

Duncan Murdoch

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `bf22fbd2bf3e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.