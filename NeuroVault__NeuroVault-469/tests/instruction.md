# Issue

**Title:** Changed default list size for collections, images, collection index and tag listing to 25.

## Description

This solves issue #352 , but can be discussed if it's appropriate to show that fixed amount of images, tags, collections. Now it is easy to change this default setting. Also, there is the option of showing 'all' instances, in case you thing that would be interesting (it is a bit dangerous too, since it could overload the db when the project grows).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8134eeac14b0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.