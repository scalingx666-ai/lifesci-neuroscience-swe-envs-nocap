# Issue

**Title:** Enh/dockerhub

## Description

- Change the references to docker images.
- Remove jupyter dockerfiles because all docker images will have jupyter. This will allow users to run the example notebooks.
- Remove _build_and_push.sh script and instead use autobuilding on dockerhub

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9f36c5e17a3d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.