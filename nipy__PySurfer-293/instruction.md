# Issue

**Title:** STY: Dont log info messages by default

## Description

When processing things in a loop I get spammed by a lot of:
```
colormap sequential: [0.00e+00, 9.68e-01, 1.94e+00] (transparent)
colormap sequential: [0.00e+00, 9.68e-01, 1.94e+00] (transparent)
colormap sequential: [0.00e+00, 9.68e-01, 1.94e+00] (transparent)
colormap sequential: [0.00e+00, 9.68e-01, 1.94e+00] (transparent)
```
I don't think this is very useful for users in general, so by default we probably shouldn't log it.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `07dc04bc7aa7`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.