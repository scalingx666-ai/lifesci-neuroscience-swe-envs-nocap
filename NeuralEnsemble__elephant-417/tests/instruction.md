# Issue

**Title:** Feature/multitaper psd estimate

## Description

This PR covers the basic implementation of multitaper in Elephant. Tests include a comparison against nitime multitaper. Any feedback is appreciated!

Please note: The test against nitime will fail due to the missing .npy files. Please check if this style of the test is sufficient. If so, the files can be uploaded to the correct location and the test should then pass.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b637b2c79814`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.