# Issue

**Title:** BF: Handle chardet 6 defaulting to MODERN_WEB encoding era

## Description

~~chardet 6.0.0 (released 2026-02-22) changed the default encoding_era to MODERN_WEB, which excludes legacy encodings like KOI8-R.  This broke ensure_unicode() and open_r_encdetect() for non-UTF-8 byte strings encoded in legacy character sets.
Pass encoding_era=EncodingEra.ALL when chardet >= 6 is detected so all encoding eras are considered during detection.~~

Above was red herring -- the actual issue was that мама is too short and apparently does look like Thai.

Also filter out the RequestsDependencyWarning that older requests emits when it encounters chardet 6.x.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `95082cfb0216`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.