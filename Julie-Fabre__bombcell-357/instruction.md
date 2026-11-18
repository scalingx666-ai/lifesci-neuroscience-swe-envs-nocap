# Issue

**Title:** Plotting bugs2

## Description

This PR covers another bug with plotting waveform overlays when param['splitGoodAndMua_NonSomatic']=True. It also converts a print statement in generate_upset_plot() to a warning that can be caught by calling modules.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4245f78942d6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.