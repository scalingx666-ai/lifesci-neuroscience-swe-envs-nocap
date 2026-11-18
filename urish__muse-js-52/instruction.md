# Issue

**Title:** PPG

## Description

# PPG on Muse

PPG data from Muse 2/Muse S is now streaming when `enablePpg` muse attribute if `true`.  

This is solving 

## Testing
Tested on Muse S.
A number of unit tests were written to test the new functionalities. All `jest` tests are passing.

## Demo

The demo has not been updated to show PPG in action, as turning on `enablePpg` will fail on Muse 2016 device (untested). However I have a local demo running streaming PPG. Perhaps we could add a "Muse version" parameter so users don't accidentally try to use PPG on Muse 1.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `650b0ec12cf2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.