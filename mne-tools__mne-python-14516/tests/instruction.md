# Issue

**Title:** ENH: Support binary file-like objects in BaseRaw.save

## Description

#### Reference issue (if any)
Related to #14514.

#### What does this implement/fix?
`mne.io.read_raw_fif` and `mne._fiff.write.start_file` already accept binary file-like streams (such as `io.BytesIO`), whereas `BaseRaw.save` only accepted filesystem paths.
- Keep caller-provided file-like streams open in `start_and_end_file` / `end_file`.
- Allow `BaseRaw.save` to write directly to writable binary file-like objects (e.g., `io.BytesIO()`), returning `[]` and raising `ValueError` if output would require multi-file splitting.

#### Additional information
AI disclosure: I used Gemini in Antigravity IDE to help trace the FIFF writer call path and draft the minimal implementation and test, which I reviewed and tested locally.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `048c2695abc6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.