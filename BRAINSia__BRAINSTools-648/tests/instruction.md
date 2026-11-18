# Issue

**Title:** BUG: Build landmark debug file names without an unbounded sprintf

## Description

Build the per-landmark debug file name with `std::string` instead of `sprintf` into a 512-byte stack buffer.

<details>
<summary>What changed and how it was verified</summary>

The landmark label comes from the model file with no length limit, so a label over about 500 characters overflowed the buffer. One site in `landmarksConstellationModelIO.h`; a scan of `.h`, `.hxx`, and `.cxx` sources found no other `sprintf`, `strcpy`, `strcat`, or `vsprintf` uses.

Verified locally on macOS (AppleClang, Release inner build): full `ninja` build and full `ctest` with no new failures against `main`. `pre-commit run --all-files` passes.

</details>

<details>
<summary>AI disclosure</summary>

Flagged by a Semgrep scan; the fix was made with assistance from Claude Code. The author reviewed every hunk and is accountable for the code.

</details>

<!--
provenance: claude-code session 2026-10-28
post_merge_action: none; independent of the other style/fix PRs opened the same day
-->

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `60b069efa672`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.