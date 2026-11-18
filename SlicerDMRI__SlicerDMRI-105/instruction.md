# Issue

**Title:** ENH: add option to limit exported scalar range to the node's range

## Description

Adds a checkbox to control whether the output range should match the
selected node's scalar range (default on); otherwise uses [0,1].

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7cab8c02c521`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.