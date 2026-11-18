# Issue

**Title:** [DOC] - Add a line noise example

## Description

A common question is how to deal with line noise, and so I started collecting my responses to turn into a proper example, which I finally fixed up and is added here. 

In the process, I ended up updating `interpolate_spectrum` a bit to support multiple interpolation zones.

I think everything here should be relatively straight-forward - @ryanhammonds, it would be great if you could read through the example for wording quirks, and check that the code updates make sense to you. Thanks!

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7c75d64d5652`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.