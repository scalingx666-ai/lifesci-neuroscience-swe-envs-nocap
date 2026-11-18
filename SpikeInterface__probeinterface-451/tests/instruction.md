# Issue

**Title:** Discard 'apps' folder when listing manufacturers

## Description

After the probe-viewer was ported to the `probeinterface_library`, we have to discard the `apps` folder when listing manufacturers

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3e8a23876b8a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.