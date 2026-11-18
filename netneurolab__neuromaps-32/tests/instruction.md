# Issue

**Title:** [ENH] New versions of MNI1521mm and MNI1522mm

## Description

I uploaded new versions of the MNI1521mm.tar.gz and MNI1522mm.tar.gz. Those new files contain 6Asym versions of the T1w brain map and of the brainmask. I updated the osf.json with the new md5 key.

IMPORTANT: I unintentionally deleted the old version of the MNI1521mm file, which means that old versions of the toolbox won't be able to fetch the 1mm atlases. We should therefore try to release a new version of the toolbox ASAP.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4e958078f8d0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.