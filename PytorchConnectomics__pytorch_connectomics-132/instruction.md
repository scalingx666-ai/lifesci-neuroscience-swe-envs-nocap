# Issue

**Title:** Fixed incorrect import in the block __init__ file and missing '**kwargs' in transformer models

## Description

removed 'unetr_block' import statement; add the '**kwargs' in two transformer models.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4ae750de5184`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.