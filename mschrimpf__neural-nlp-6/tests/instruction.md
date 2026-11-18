# Issue

**Title:** ECoG packaging and benchmarks

## Description

1) Creating ecog_greta.py in /neural-nlp/neural_nlp/neural_data. Contains packaging of the ECoG data, which is called in the neural.py script. I hardcoded the data and stimuli directories in the beginning of this script to my /om/user/gretatu/... directories, which you should have access to.

2) Edits to neural.py in /neural-nlp/neural_nlp/benchmarks/. This contains a "Fedorenko2016" benchmark, that loads the data from the ecog_greta.py script.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5d78d22b39f2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.