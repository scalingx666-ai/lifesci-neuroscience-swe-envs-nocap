# Issue

**Title:** fix: camera backend selection via pref and DirectShow enum without FFPyPlayer

## Description

This PR makes it so the camera backend is selected by a preference. It also fixes a bug on Windows where camera's aren't listed without FFPyPlayer because enumerating devices with the DirectShow interface required it.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ccd2ea4008e1`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.