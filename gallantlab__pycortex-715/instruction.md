# Issue

**Title:** Fix shader problem that broke 2-D vertex data

## Description

This pr fixes the recently introduced shader bug that broke 2-D vertex data displays (see issue #714). The core issue is that we are hitting the upper limit on the number of vertex attributes that we can pass to the shaders, and this causes threejs to silently choke. It also adds some tests that look for blank rendered images. This is not a real visual regression test — that would supersede this test.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ef29edef1bb5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.