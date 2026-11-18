# Issue

**Title:** traitsui in Debian

## Description

In Debian Wheezy, traits.ui does not exist, but there is only traitsui
http://packages.debian.org/wheezy/python-traitsui
So, make import more flexible. I hope that the nesting of try-except is not too ugly.

Cheers,
G

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ecb2b5226e2b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.