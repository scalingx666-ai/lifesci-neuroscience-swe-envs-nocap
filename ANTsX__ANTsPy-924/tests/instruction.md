# Issue

**Title:** BUG: Reject failed HTTP responses before caching test data

## Description

`get_ants_data()` currently writes the response body to its destination without checking the HTTP status. A failed download (for example, HTTP 404) therefore leaves an error page cached as an image; subsequent calls reuse that file because it exists.

Call `raise_for_status()` before opening the destination so HTTP failures propagate without creating a cache entry. Add two mocked-response tests covering a rejected HTTP 404 and a successful HTTP 200 download.

Validation: both new tests passed against the pure Python source helper, loaded in isolation without the compiled `ants` package. The 404 regression test failed before the fix. No network downloads, native build, or full test suite were run.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f2212f56965e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.