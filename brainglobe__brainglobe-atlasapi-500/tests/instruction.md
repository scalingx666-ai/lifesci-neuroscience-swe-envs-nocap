# Issue

**Title:** Allen bbp ccfv3a entire mouse brain, improve mesh utils, and add metadata filtering to wrapup

## Description

Here I add the extended and improved CCFv3 annotation and Nissl atlas of the entire mouse brain by Piluso and colleagues (full disclosure I'm also an author). 

I have also integrated the filtering script we have previously talked about that automatically removes metadata regions that do not exist in the annotation, previously a point of friction in integration scripts. I moved int into the wrapup script. 

Another addition here is the addition of a annotation + region dictionary to mesh function. This code is the same in every script I submit and is a large effectively boiler plate function that is copy and pasted between them. By moving it into mesh utils we make atlas integration easier and the integration scripts cleaner.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c2d022009b71`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.