# Issue

**Title:** ENH: add dcm_qa as a submodule and use in travis

## Description

- [ ] verify that it all works ;)  especially in view of 

would require learning a bit about git modules but IMHO it is the correct way to do it and bind version (commit) of dcm_qa into specific state of dcm2niix.  If anything changes within dcm_qa, you would need first o push dcm_qa to github and then commit the change here

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0f6b70c6c635`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.