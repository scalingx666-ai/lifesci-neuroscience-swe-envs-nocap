# Issue

**Title:** tweak gene expression to link to Neurosynth

## Description

Here's a first pass at this. Works fine but may need some tweaking as it's kind of ugly. Feel free to modify, or suggest a better way to present the info. Maybe we should add extra table columns for NCBI and NS links? Or shorten Neurosynth to 'NS'?

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `aae8138cab60`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.