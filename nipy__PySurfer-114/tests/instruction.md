# Issue

**Title:** SETUP:  add nibabel to install_requires

## Description

As discussed in

Nibabel seems to have the freesurfer package since 1.2, so I specified 1.2 as the minimum requirement. Is there a reason to require 1.3?

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6bc049544881`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.