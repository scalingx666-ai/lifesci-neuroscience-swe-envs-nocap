# Issue

**Title:** BF: use datalad/packages method of installing git-annex

## Description

"snapshot" method is installing into a temp folder and we would need to setup env var file to source etc.

I have introduced that change in recent  and missed that for that original commit appveyor did fail, and subsequent commit af2bd74 CI run had only OSX brew fail which made me think appveyor is ok, but apparently it was not there at all! So I missed that failure

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `bfeb0a852333`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.