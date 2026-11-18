# Issue

**Title:** docs: add corpus overview and research case studies

## Description

## Summary
- update the English and Chinese READMEs with the finalized 74-skill, 21-category, 7-domain inventory
- clarify that the 7,233-item hosted corpus is not distributed with the open-source package
- remove stale EthoClaw and NeuroClaw skill-source references
- add the finalized corpus figure and three research case studies with evidence boundaries preserved
- update the hosted demo link and align PI Agent / Graph of Trace terminology

## Included case studies
- mouse visual hierarchy from Allen Neuropixels recordings
- functional-connectivity fMRI pain signature
- EEG motor-imagery decoding

## Validation
- GitHub Markdown rendering checked for both READMEs
- all local image references verified
- `git diff --check`

## Notes
- The RSC case image was omitted because its displayed MAE conflicts with the current technical-report text.
- The older team architecture image was omitted because it still reports an outdated skill count.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2e67424e381e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.