# Issue

**Title:** Travis scripts

## Description

Currently, a lot of setup is done in the `.travis.yml` directly, where the same logic would also be useful for downstream projects like `catpy` and CATMAID extensions, which may want to stand up minimal CATMAID instances for testing purposes. These downstream projects would need to manually edit their own travis configuration every time the CATMAID setup process changes.

By factoring some of this setup into standalone scripts, the complexity of CATMAID's travis config is reduced and the pipeline for downstream projects is made less brittle.

On the downside, which logic to include in those scripts and how to divide them is somewhat arbitrary and may be biased towards my own use case for `synapsesuggestor`. It also makes the travis config slightly more opaque. Feedback welcome.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `80e798bec79a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.