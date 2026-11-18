# Issue

**Title:** Connector Viewer: resolve source reverse bug

## Description

Possibly 

Outdated browsers don't like destructuring assignment, which would
break on clicking the 'Reverse' button. The assignment isn't necessary
in this case so it has been removed.

Also disables 'Reverse' button while skeleton sources are sync'd.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4cc34a991f75`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.