# Issue

**Title:** [FIX] Use http://www.dicomlookup.com for DICOM tags

## Description

http://www.dicomlookup.com is back up. It no longer accepts HTTPS connections or dropping the `www`.

Based on http://www.dicomlookup.com/about:

> This site is a hobby project. Your support to cover hosting costs is greatly appreciated.

I think it's not ideal to slam their server thousands of times a day, so I'm still excluding them from the link checker.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b766732218cb`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.