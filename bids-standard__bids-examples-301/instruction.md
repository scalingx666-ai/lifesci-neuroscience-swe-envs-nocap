# Issue

**Title:** Change InjectedMass and SpecificRadioactivity to "n/a" to provide an example on this

## Description

This PR updates the InjectedMass and SpecificRadioactivity to "n/a" to show an example case where this information is not available (in line with the PET-BIDS specification). 

This issue was raised here: 

And PR to solve this here:

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3e91333f20e2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.