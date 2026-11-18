# Issue

**Title:** Update SynthSR

## Description

- 
 
 This is the minimal change to SynthSR
 - Detects the TensorFlow version to ensure forward and backward compatibility with the removed fused option.
 - Removes the `surfa` dependency.
 - If `FREESURFER_HOME` is not set, tests if `models` are located in the same folder as the script.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a8b5946ca12b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.