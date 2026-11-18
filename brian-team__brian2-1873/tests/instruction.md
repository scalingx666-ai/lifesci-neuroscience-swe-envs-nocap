# Issue

**Title:** brian2cuda:extract overridable helpers for cpp standalone device.delete

## Description

## Changes
Extract the file allowlists used by `CPPStandaloneDevice.delete` into overridable helpers: `data_files_to_delete()` and`code_files_to_delete()`. Subclasses can now extend the lists with `super()` instead of copying `delete`.
This prepares a clean extension point for brian-team/brian2cuda#339.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `532d97267ead`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.