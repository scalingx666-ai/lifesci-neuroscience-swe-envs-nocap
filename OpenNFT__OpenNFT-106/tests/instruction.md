# Issue

**Title:** Signal preprocessing unification

## Description

Update:

- JSON protocol structure changed, 

- Contrast field renamed to ContrastActivation
- SignalPreprocessingBasis field added (this field contains regressors names for signal preprocessing)

- spmDesign variable replaced with signalPreprocGlmDesign with the same functionality
- initialization of signalPreprocGlmDesign is unified for every protocol
- rtQA optimization in signal preprocessing

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7b8026de6d76`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.