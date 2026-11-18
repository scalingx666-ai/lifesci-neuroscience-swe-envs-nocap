# Issue

**Title:** Adding cbsdk and SdkApp support for cbhwlib.cpp::cbGetSampleGroupInfo

## Description

I have added support for the cbGetSampleGroupInfo in cbhwlib.  This function call allows you to determine the  # of channels in a group, sampling period, and label.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b5b9eddfa526`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.