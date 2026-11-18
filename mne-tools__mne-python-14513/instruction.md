# Issue

**Title:** Fix Brainvision Greek mu

## Description

Some BrainVision headers use a Greek mu (U+03BC, μV) instead of the micro sign (U+00B5, µV). MNE recognizes only the micro sign and plain uV, so Greek mu signals are currently not rescaled and get the misc channel type. Here I add support for Greek mu and treat it just like the other two.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `81331bb6e1a3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.