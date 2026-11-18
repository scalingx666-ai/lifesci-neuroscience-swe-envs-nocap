# Issue

**Title:** Refactor bigbrain livequery to streamline results and data sources

## Description

- Pull profile data from EBRAINS https://search.kg.ebrains.eu/instances/26d25994-634c-40af-b88f-2a36e8e1d508,
- If a higher level region is queried, choose a joint space while prioritizing BigBrain space
- Pull mesh data from bigbrain ftp, https://ftp.bigbrainproject.org/bigbrain-ftp/BigBrainRelease.2015/3D_Surfaces/Apr7_2016/gii/

EDT:: todos are moved to issues

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d35e49bd2120`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.