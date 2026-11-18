# Issue

**Title:** Review of the slice timing correction inputs: --args_3dTshift can now…

## Description

… provide any custom parameters to 3dTshift. This replaces parameters --tpattern and --interp_method.

<!-- This is an auto-generated comment: release notes by coderabbit.ai -->

## Summary by CodeRabbit

* **Refactor**
  * Consolidated slice timing correction (STC) configuration: removed separate `--tpattern` and `--interp_method` CLI options in favor of a new unified `--args_3dTshift` option. This accepts custom 3dTshift command-line arguments as a single string parameter, providing greater flexibility in temporal shifting settings while simplifying the parameter structure.

<!-- end of auto-generated comment: release notes by coderabbit.ai -->

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e1281e483f57`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.