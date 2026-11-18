# Issue

**Title:** Check that classification tags are used in decision trees and that each decision tree includes the Likely BOLD tag

## Description

. This should make it easier to use tedana with decision trees that don't use the Likely BOLD tag.

Changes proposed in this pull request:

- Use accepted classification to trigger ICA restart in tedana workflow, instead of the Likely BOLD tag. This was already the case in the ica_reclassify workflow, so I just needed to change the main tedana workflow.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `35aef01c9ab5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.