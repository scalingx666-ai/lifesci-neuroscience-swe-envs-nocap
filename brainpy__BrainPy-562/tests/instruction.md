# Issue

**Title:** [math] change the internal implementation of surrogate function

## Description

<!--- Provide a general summary of your changes in the Title above -->
<!--- Please do remember to follow the contributing guidelines -->

## Description

- add ``heaviside_p`` primitive
- all surrogate functions (with one argument) support both JVP (forward) and VJP (backward) differentiations
- enabling the forward gradients of spiking neural networks


## How Has This Been Tested

Yes.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `68c16380912e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.