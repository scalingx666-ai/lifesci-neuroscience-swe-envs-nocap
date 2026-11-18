# Issue

**Title:** FIX: Infer file format and avoid duplicate extensions in stc.save

## Description

#### reference issue (if any)

Supersedes #13165

#### what does this implement/fix?
- supports `ftype='auto'` as the default in `SourceEstimate.save()` and `VolSourceEstimate.save()` to infer file format from file extension.
- avoids duplicate extension/hemisphere tags when `fname` already ends with tags like `-lh.stc` or `.stc` (e.g. preventing `test-lh.stc-lh.stc`).
- updates `read_source_estimate()` to gracefully resolve both clean filenames and legacy filenames.
- augments existing tests in `test_source_estimate.py` to cover `auto` inference and deduplicated extensions.

#### additional information
ai assistance disclosure: i used google antigravity to help locate the abandoned pr history, identify the edge cases in `read_source_estimate`, and write the test cases in `test_source_estimate.py`.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7c1f9326dc2b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.