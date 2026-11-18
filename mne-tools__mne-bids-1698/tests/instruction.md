# Issue

**Title:** ENH: Allow passing pre-collected fnames to find_matching_paths

## Description

#### Reference issue
.

#### What does this implement/fix?
- Add `fnames=None` to `mne_bids.find_matching_paths` / `_return_root_paths`, filtering pre-collected local or virtual paths relative to `root` without walking the filesystem while preserving CTF `.ds` container collapsing, hidden/extensionless skipping, `ignore_json`, `ignore_nosub`, and `datatypes` filtering.

#### Additional information
AI disclosure: I used Gemini in Antigravity IDE to help trace the `find_matching_paths` call graph and draft the implementation and test, which I reviewed and tested locally.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0078db27aab7`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.