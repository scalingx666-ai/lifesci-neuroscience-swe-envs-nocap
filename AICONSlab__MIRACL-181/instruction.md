# Issue

**Title:** [PR/fix] CLAR Allen Olfactory bulb fix

## Description

The logic to check whether the olfactory bulb should or shouldn't be removed was incorrect. It would always evaluate to false since it would only check for an empty flag or a None value. Adding a check for 0 fixed the problem. Another issue is that the olfactory bulb templates are
hardcoded to 25vox. This needs to be fixed as well. A ticket has been opened internally.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2ae87eba211d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.