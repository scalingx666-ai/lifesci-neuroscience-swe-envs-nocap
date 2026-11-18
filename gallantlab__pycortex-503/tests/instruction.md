# Issue

**Title:** FIX do not use a default layout selection for multiple volumes

## Description

Whenever more than 10 volumes are passed to `cortex.webgl.show` or `make_static`, the viewer would crash because of the default `layout`. This PR removes the default and lets the user decide what layout to use explicitly.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2a9a5bc05ca5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.