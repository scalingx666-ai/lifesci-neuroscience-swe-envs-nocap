# Issue

**Title:** Change 'http' into 'https' in domain name

## Description

This is a very simple update which changes 'http' into 'https' into the `DOMAIN_NAME` variable. 

This will ensure that any NIDM pack uploaded will include https paths to the images (rather than http  then redirected to https).

*But* I don't know how this will impact the rest of NeuroVault so please feel free to ignore if you think that's a bad idea. (The updated nidmviewer should work regardless.)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4613e26af782`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.