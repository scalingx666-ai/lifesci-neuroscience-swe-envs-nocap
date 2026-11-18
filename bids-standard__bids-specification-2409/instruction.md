# Issue

**Title:** [ENH] Allow rawbids/ in derivative datasets for the raw BIDS source

## Description

PR #2191 added rawbids/ to the study DatasetType but not to derivative, even though the same convention -- "rawbids/ holds the raw BIDS dataset" -- is equally applicable when a standalone derivative dataset includes its raw source.  I think everyone was just too tired and ready to move on with their lives, thus missed that omission, although the wise @effigies 

> Finally, for the sake of consistency, rawbids/ is permitted for derivative datasets, while it is not meaningful for raw datasets.

but we (attn @julia-pfarr @nikhil153) all missed that it was not defined for the `derivative` datasets.  Here me and claude are addressing that:

- Add rawbids as an optional opaque subdirectory of the derivative DatasetType in src/schema/rules/directories.yaml.
- Update the derivative example in common-principles.md to use rawbids/ instead of sourcedata/raw/.
- Clarify that rawbids/ is reserved for raw BIDS datasets in both study and derivative cases, and that derivatives of derivatives MUST place their source derivative under sourcedata/ (not rawbids/).

Marking it for the same milestone as the #2191

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `308395fc0176`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.