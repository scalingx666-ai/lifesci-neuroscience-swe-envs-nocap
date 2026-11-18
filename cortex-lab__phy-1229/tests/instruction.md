# Issue

**Title:** Fix removal of imp in python 3.12

## Description

@rossant,

I don't actually have the phy test suite setup so I made this fix based on reading python docs. In Python 3.12 they have completely removed `imp` and the rec is to switch to `importlib`. Could you either test to make sure these changes work or walk me through setting up the phy test suite so I can make sure this works. 

If you don't want to do this I'll do a PR to change the python version to < 3.11 for the install stuff.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8bf8cf751fcb`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.