# Issue

**Title:** ENH: Added edit node support to tractography interactive seeding

## Description

The feature allows setting nodes to their proper places in the GUI.
Subject hierarchy support also added so that output fiber tract is placed under the DTI volume in the hierarchy

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `73f47533a5da`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.