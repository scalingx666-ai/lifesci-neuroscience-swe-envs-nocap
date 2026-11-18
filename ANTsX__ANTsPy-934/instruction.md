# Issue

**Title:** BUG: Join automatic sample filenames to the cache directory

## Description

## Problem

Three string concatenations assume that antsx_cache_directory ends in a separator. A request for /tmp/base/cache instead returns and writes /tmp/base/cacher16slice.jpg, cachemni.nii.gz, or cachepcasl.nii.gz. An existing correctly placed cache file is also missed.

## Change

Replace exactly the three automatic filename concatenations with `os.path.join`. File basenames, requests handling, response validation, explicit target paths, and the public `get_ants_data` alias retain their existing behavior.

Three new unittest methods cover r16slice.jpg, mni.nii.gz, and pcasl.nii.gz with and without a trailing separator (six download cases and six existing-file cases). They assert returned paths, downloaded bytes, absence of sibling files, and no HTTP request on cache hits. Three explicit-target cases check an outside-cache destination and repeated reuse. requests.get is mocked at the HTTP boundary; the real path and file I/O code executes.

## Validation

- The new regressions fail on the unmodified source at `e0455f5a006dfc79188d3b778463c37f9a38d189` for the expected reason.
- Focused tests: `5 passed, 15 subtests passed in 6.66s`.
- Relevant existing tests: `2 passed in 4.97s`.
- Python syntax, scoped Ruff checks, and patch application checks pass.

These results use the complete current Python source with the released antspyx 0.6.3 native backend. A fresh current-source native build and the full upstream test suite have not been run yet.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e0455f5a006d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.