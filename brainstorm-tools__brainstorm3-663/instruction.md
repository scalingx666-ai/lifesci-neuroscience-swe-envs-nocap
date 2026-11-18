# Issue

**Title:** Brainstorm: Apple silicon support

## Description

This PR is here to use the maint branch of SPM when using an ARM Mac (which requires new Mex files) and fix a small bug

Note: this cannot be merged as is as brainstorm doesn't really like that SPM is in the folder called spm12-maint. But this works after adding SPM manually to the path: addpath('/Users/edelaire1/.brainstorm/plugins/spm12/spm12-maint')

Edit: actually would that be ok with you if we directly pull from the main branch of SPM: https://github.com/spm/spm ?

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4bb2ce032a4c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.