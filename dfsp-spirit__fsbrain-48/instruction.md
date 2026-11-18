# Issue

**Title:** Change rgl.* calls to *3d calls.

## Description

Some upcoming changes to the rgl package will require changes to
fsbrain.  I will be deprecating a number of rgl.* function calls.
You can read about the issues here:

      https://dmurdoch.github.io/rgl/articles/deprecation.html

I have made the required changes to fsbrain in the attached patches. These 
changes should work with both old and new rgl versions.

I doubt if these will have any effect on #46, but it might be worth trying them out.  As I commented there, the sample code dies very early on my system before any graphing, so it might be completely unrelated to rgl.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6245ce86fbc4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.