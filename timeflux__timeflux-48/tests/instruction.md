# Issue

**Title:** Fix window

## Description

**Old way:** when the node received more data than window length, the older data
was lost.
**New way:** keep the last samples in the buffer and append it to the next chunk

Also, I added a few sanity checks, such as index monotonic and step <= =length 

**test**: Add fixture in the unit test, allowing them to be ran independently

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `cc237efb3e8e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.