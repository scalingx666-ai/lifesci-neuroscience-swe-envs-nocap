# Issue

**Title:** restrict mouse events that trigger click

## Description

All mouse events (left/right/middle click, as well as turning the wheel and what not is currently triggering mouse events. 
This PR limits it to left/right/middle clicks by hard coding it. 

I couldn't see a benefit of making it a parameter. But maybe, we could restrict it even more? Like only left-clicks?

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `000dd631c7ed`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.