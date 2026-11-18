# Issue

**Title:** fix(server): Prioritize BIDS valid READMEs falling back to anything else only if none are present

## Description

The README resolver would request README at the top level and resolve to whatever matching extension was read first in filesystem order. This means that usually if you had README.md and README.html, you'd get README.html when the intention is to prioritize README.md as allowed by BIDS. Instead we check all the BIDS URLs first and only fallback to others if none are present.

Fix #4020

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8147f7250655`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.