# Issue

**Title:** Fix rootURL assignment in main.js

## Description

This PR fixes a bug that was introduced in my previous PR #42. 

In PR #42, I added the ability to use query parameters to immediately run a model by setting the `model` query string. As an example, the URL `https://brainchop.org/?model=11` would immediately set the model to the model at the 11th index in the list and then run it. This behaviour is useful for testing in an automated way. This method didn't work when deployed to github pages. 

This should be fixed now.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3d51687a582f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.