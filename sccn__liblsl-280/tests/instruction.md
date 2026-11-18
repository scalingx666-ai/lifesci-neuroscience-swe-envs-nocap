# Issue

**Title:** Allow UID to be reset via C API (extends #260)

## Description

Extends #260 by @zeyus, which exposes the existing `stream_info_impl::reset_uid()` through the C API. Useful for generating a UID on a locally-constructed `stream_info` that has not yet been associated with an inlet.

This PR keeps @zeyus's original commit and adds a small follow-up commit:

- Collapse the `lsl_reset_uid` C wrapper to the one-line style of its siblings and drop a stray blank line.
- Add a matching `stream_info::reset_uid()` wrapper to `include/lsl_cpp.h` for C++/C API parity.

Verified locally on macOS: configures and builds, and `_lsl_reset_uid` is present in the exported symbols of the shared library.

.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a2051c1ac259`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.