# Issue

**Title:** ENH: dimensional return from which

## Description

The current implementation of image relational operators applied to an antsImage ( e.g. maskImg > 0 ) always return a 1D vector, unlike the same operation on an array which returns a boolean array of the same size and dimension as the input array, thus providing the ability to get the indices of the locations via "indices = which( myArray > 0, arr.ind=T )"  The changes here resize the returned vector to equal the dimensions of the input image so voxel indices can be obtained via "which( maskImage > 0, arr.ind=T )" Since these arrays can also be indexed as 1D vectors, this shouldn't be problematic for existing code.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `28e32f3dcc8c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.