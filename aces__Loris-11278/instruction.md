# Issue

**Title:** [biobank] Link Visit Label to the instrument list on the Pool tab

## Description

## Description

On the Pool tab, `formatPoolColumns` looks for the visit's session among the values of the candidate entry in `options.candidates`. None of them has a `label`, so the session ID is always undefined and the Visit Label renders as plain text.

The candidate entry carries its `sessionIds`, and the Specimen tab already finds the session through them.

## Changes
- Found the session for the Visit Label link through the candidate's `sessionIds`, as the Specimen tab does.

## Testing Instructions
1. Open the Biobank module and go to the Pool tab.
2. Click a Visit Label. It opens the visit's instrument list.

## Related Issues
Mirrors aces/biobank#289

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4f495c500dec`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.