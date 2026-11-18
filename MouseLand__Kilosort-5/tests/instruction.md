# Issue

**Title:** Gui

## Description

This version works, as you saw when you visited. I believe Sylvia has used it some. But it would be good if someone there could test it. 

It also has a few known bugs/todos, including: 
1) There are occasional graphical glitches and slowness-es that I would like to fix with some refactoring
2) you can't yet modify ops in an easy way (the way to do it is to get the gui object on the command line and edit the ops structure within it directly - not terrible, but should be gui-based)
3) you can't yet create a new channel map in an easy way (same)
4) you can't write your run out into a script for batch processing

There are others but I think those are the main things. It would just take me a day or two to do it but I don't have a day or two right now. I think I would be able to do it between now and the end of the year, probably.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `77bd4851430f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.