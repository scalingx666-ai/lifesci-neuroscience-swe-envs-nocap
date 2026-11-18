# Issue

**Title:** [simulate reccording] Allow to choose the channel used for simulation

## Description

Hello, 

This PR is here to allow users to choose the output study used to simulate recording from a source map instead of simulating within the same study. 


One use case that was presented in the forum is: you do source localization from EEG/MEG and then simulate the recording in SEEG from the source map: https://neuroimage.usc.edu/forums/t/ieeg-simulation-with-meg-data/56513

Before, the user would have to copy the source map to the study that contains the SEEG channel. With this, the copy is no longer necessary, which is good when doing simulations, as it avoids copying many maps. 


Edouard

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5cb8a682d02c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.