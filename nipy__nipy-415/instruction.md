# Issue

**Title:** RF: only import matplotlib if plotting

## Description

Scripting module doing unconditional import of matplotlib.pyplot,
triggering problems where the chosen backend is not present.  Delay
import until using for plotting.

Maybe closes gh-414.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ab8aa8659a57`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.