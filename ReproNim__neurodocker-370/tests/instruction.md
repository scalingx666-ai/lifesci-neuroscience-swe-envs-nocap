# Issue

**Title:** add minimal install (thanks pwighton)

## Description

this adds a link to a minimal tarball for recon-all as described here: https://github.com/pwighton/fs-docker/blob/69419bdd6a77803ac6970a94c2b242e2f858a47c/20201127-fs711-neurodocker-min.md

the only addition was this command to get the source files included in the distribution.

```
cmd0="bash /opt/freesurfer-7.1.1/SetUpFreeSurfer.sh"
```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a4940e311a26`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.