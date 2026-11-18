# Issue

**Title:** DOC: Add benchmark page

## Description

First pass, just translating what's in the OHBM abstract into RST. LMK if you have comments on the overall presentation style.

Also fixes some warnings/errors during doc builds that weren't caught before release.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `47552549cfae`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.