# Issue

**Title:** fixup generation of template config files

## Description

on `main`, template config files have a couple of bad features:

these lines get commented out, making the file syntactically invalid (unclosed parens):

https://github.com/mne-tools/mne-bids-pipeline/blob/6005b52381203ed3993dc1cc4943e8fd507f993b/mne_bids_pipeline/_config.py#L11-L15

this line does not get commented out, because it starts with "from":

https://github.com/mne-tools/mne-bids-pipeline/blob/6005b52381203ed3993dc1cc4943e8fd507f993b/mne_bids_pipeline/_config.py#L348

This PR:

- [x] fixes commented-out import lines (item 1 above)
- [x] fixes missed commented-out line starting with "from" (item 2 above)
- [x] writes multiline string literals (AKA, the docstrings for each config value) as-is, so that in the template config file, the IDE will (potentially) highlight them a different color, making it much easier to see which lines are changable config values and which are supporting documentation.
- [x] removes a few unnecessary `# noqa E501` comments
- [x] changes a couple cases of `Sequence["str"]` to `Sequence[str]`
- [x] Updates the changelog (`docs/source/dev.md.inc`)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0486b6a82b07`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.