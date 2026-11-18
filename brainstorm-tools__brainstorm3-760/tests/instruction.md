# Issue

**Title:** [SNIRF]] Fix data importation

## Description

Improve snirf file reading. This is a smaller version of #756 for easier review

- Read file where timeOffset is not defined in the aux structure
- Fix the channel names when using custom name (replace Tx with S and Rx with D)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `69bbf5335fd9`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.