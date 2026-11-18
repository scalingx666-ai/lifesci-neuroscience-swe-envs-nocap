# Issue

**Title:** Converting TFJS models back to pytorch and also ONNX

## Description

We have our own clean and 3rd party independent code to save models to tfjs format, such that brainchop can use it. It is convenient for debugging purposes and also for possible future fine-tuning to be able to convert from brainchop models back to pytorch. Additionally, now that ONNX runtime supports everything to run brainchop's models, the new code enables saving the models in ONNX

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `fd33e4f25cba`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.