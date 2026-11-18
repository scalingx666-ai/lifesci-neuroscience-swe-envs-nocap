# Issue

**Title:** Potential fix for code scanning alert no. 2: Workflow does not contain permissions

## Description

Potential fix for [https://github.com/LorenFrankLab/spyglass/security/code-scanning/2](https://github.com/LorenFrankLab/spyglass/security/code-scanning/2)

To fix the problem, add a `permissions` block to the workflow file to explicitly set the minimum required permissions for the jobs. Since the jobs only need to check out code and run linting/spell checking, they only require `contents: read` permission. The best way to do this is to add the `permissions` block at the top level of the workflow (after the `name` and before `on`), so it applies to all jobs in the workflow. No changes to the jobs themselves are necessary.

---

_Suggested fixes powered by Copilot Autofix. Review carefully before merging._

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `78996ddb494a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.