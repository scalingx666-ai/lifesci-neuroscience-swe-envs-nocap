# Issue

**Title:** [ENH] Add major OS executables on new release

## Description

This PR adds a GH workflow that builds and adds executable files for the 3 main programs, namely `dcm2bids`, `dcm2bids_helper`, and `dcm2bids_scaffold`, when a new release is published. 

This workflow will run **only** when there is a new release and will build executables for Windows, Linux and macOS. I have set the executable bit, so technically `chmod u+x dcm2bids*` won't be needed as well. 

See https://github.com/SamGuay/Dcm2Bids/releases/tag/3.0.0-alpharc for an example.

Caveat: Windows and macOS builds haven't been tested. Linux bin works properly on Ubuntu 20.04 and up. Ideally, the build would be done on CentOS 7 but GH doesn't have CentOS runners... so the bins might need to be recompile to work on HPC running RHEL-based OSes.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8ab482e7cba1`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.