# Issue

**Title:** FIX Improve robustness of attribute query for `JSProxy`

## Description

Functions like `code.export.plot_panels` fail from time to time in an unpredictable way. It looks like the culprit is that the `JSProxy` object tries to get some attributes that do not exist yet (). However, when inspecting the JavaScript console, those attributes do exist. This suggests that the querying process is not robust enough to random delays in updating the viewer/JS environment. 

This PR adds a simple logic that queries for the desired attr up to 10s before giving up. It should make the querying process a bit more robust.

 (hopefully for good)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `876a5548d927`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.