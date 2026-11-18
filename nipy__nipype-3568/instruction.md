# Issue

**Title:** STY: Remove duplicated trait in EddyOutputSpec

## Description

`out_shell_pe_translation_parameters` in `fsl.epi.eddy` appeared twice, removed the second one to avoid redundancy

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `450be34b4540`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.