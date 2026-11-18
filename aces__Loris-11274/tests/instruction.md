# Issue

**Title:** [biobank] Pool and filter specimens by visit label

## Description

## Description

The pool form matches specimens on their session, and its Visit Label dropdown builds its options from the selected candidate's own fields, so it comes up empty. The specimen tab's Visit Label filter is a free text box, and its link needs the session ID while the column holds the visit label.

This ports aces/biobank#282 and aces/biobank#280. The options endpoint now returns the visit labels that have specimens, and the pool form and the specimen tab both work from those.

## Changes
- The options endpoint returns `visitLabels`, the distinct visit labels of sessions with specimens.
- The pool form filters and validates specimens by visit label, and its Visit Label dropdown lists those labels without needing a PSCID first.
- The specimen tab shows the visit label, filters it with a dropdown, and links it to the candidate's session with that label.

## Testing Instructions
1. Open the Pool Specimens form and check that the Visit Label dropdown lists the visit labels in use.
2. Pick a visit label and check that the barcode list only offers specimens from that visit.
3. Add a specimen, then try to add one from a different visit, and check that you get the "same PSCID, Visit Label, Type and Site" warning.
4. On the specimen tab, filter by Visit Label from the dropdown, then click a visit label and check that it opens that session's instrument list.

## Related Issues

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a40ffe7695b5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.