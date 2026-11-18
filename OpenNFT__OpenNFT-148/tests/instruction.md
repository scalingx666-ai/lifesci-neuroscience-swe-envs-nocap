# Issue

**Title:** Optimization (GUI and image computations)

## Description

IMPORTANT:
- 'yield' method appears as an efficient yet potentially unstable solution. GUI parallelization is WIP, stay tuned.

NEW:

- orthview -> volviewformation process
- all calculations for mosaic and orthogonal images moved to volviewformation process
- such as thresholds and RGBA image computations
- mosaic display is called asynchronously (like orthview)
- preprVol calculations do not freeze GUI anymore

FIXES:

- switching SNR/CNR/Statistical images after run is stopped
- CNR image for orthogonal projections

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f9db42aba510`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.