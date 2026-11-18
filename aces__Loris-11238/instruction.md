# Issue

**Title:** [SQL] Integrate coord systems with BIDS tables

## Description

, companion PR of 

Integrate the physiological coordinate system tables with the BIDS files table. Note that since there can be several coordinate systems in a single BIDS coordinate system file, the foreign key here is non-unique (unlike most of the BIDS file foreign keys in other tables).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `bad3ac76b2f5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.