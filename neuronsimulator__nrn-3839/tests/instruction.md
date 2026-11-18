# Issue

**Title:** Make `neuron` the default package name

## Description

9.0.2 release attempt failed because
master’s #3807 workflow plus release/9.0 still shipping the old default name without the old “rename on release” step.
This solution is to cherry pick c8289d44, merge this to release/9.0 and restart the NEURON release workflow.

Note: the former github Release 9.0.2 (in prerelease state) has been removed as well at the former 9.0.2 tag.
They will be re-created by the NEURON release workflow. This is ok because no wheels were uploaded during the previous release attempt.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `37bcc558e983`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.