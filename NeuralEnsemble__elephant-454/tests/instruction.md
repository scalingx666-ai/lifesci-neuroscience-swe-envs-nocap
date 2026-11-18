# Issue

**Title:** Add a function to discretise spiketimes

## Description

Adds a function to `conversion.py` which takes a `SpikeTrain` or a list of `SpikeTrain`s as input and returns copies with discretised times. 
This is useful for using `spike_train_synchrony.Synchrotool` with artificial spike trains which do not have a sampling rate, e.g. for Monte Carlo significance computations. It applies a sampling rate to those spike trains to make them resemble experimental spike trains recorded in a setup with an intrinsic sampling rate.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d0d39206a5a2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.