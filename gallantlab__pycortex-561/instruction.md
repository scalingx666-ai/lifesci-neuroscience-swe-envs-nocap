# Issue

**Title:** feat: add config option for uniform lighting

## Description

Discussed in #560, this adds a simple option to enforce uniform lighting (no shadows or specularity) within pycortex webgl viewers. This is turned on by adding `uniform_illumination = true` to the user config file.

This option is set to `false` by default, so lighting should remain as it currently is unless this option is changed to `true`.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9343bddf4e69`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.