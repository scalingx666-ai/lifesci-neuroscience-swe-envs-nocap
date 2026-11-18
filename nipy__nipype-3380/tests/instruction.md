# Issue

**Title:** FIX: Extension not extensions, after pybids v0.9

## Description

## Summary
Updates `BIDSDataGrabber` to reflect that `extensions` is a deprecated keyword, in favor of `extension`

Related issue: https://neurostars.org/t/issue-with-bidsdatagrabber-in-nipype-1-6-1/20243/3

## Acknowledgment

- [ X ] \(Mandatory\) I acknowledge that this contribution will be available under the Apache 2 license.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `79e2fdfc3875`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.