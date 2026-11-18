# Issue

**Title:** COMP: Key the CI test-data cache on the content links

## Description

Keys the CI test-data cache on the content links, so new test data is cached, and fixes a cache path that made the Linux-saved cache unusable on macOS.

<details>
<summary>What changes</summary>

- The old key was only the BRAINSTools major.minor version and was saved only on an exact-key miss, so data added later was downloaded again on every run until the version bumped.
- The old path was an absolute runner path. `actions/cache` hashes the literal path into the entry's version, so a cache saved on Linux could never be restored on macOS. The cache now lives at `.ExternalData` inside the workspace on both.
- A new `populate-externaldata-cache.yml` is the only writer. It prefetches every object (397 objects, about 3 GB, `ReferenceAtlas` excluded because CI leaves `USE_ReferenceAtlas` off), verifies each SHA-512, retries transient mirror errors, and refreshes weekly. `build.yml` only restores.
- New script: `Utilities/Maintenance/PrefetchSha512ContentLinks.py`.

</details>

<details>
<summary>Testing and rollout</summary>

- The prefetch script was run on a scratch tree: real objects fetched and hash-verified, a bad hash exits 1, a rerun skips present objects, `ReferenceAtlas` is excluded, and a simulated 503 is retried. It has not been run on the full set.
- `actionlint` is clean; `pre-commit run --all-files` passes.
- The cache itself can only be validated on GitHub. After merge run `gh workflow run populate-externaldata-cache.yml`; until then CI falls back to the old `ExternalData-BRAINSTools-v5.8` entry.
- The repository is at about 3.4 GB of its 10 GB cache budget, and this cache is about 3 GB (was 1.78 GB).
- Small textual conflict with the workflow-hardening PR on the cache action's pin line.

</details>

<details>
<summary>AI disclosure</summary>

Claude Code wrote the change and ran the checks listed above. The author reviewed the diff.

</details>

<!--
provenance: claude-code session 2026-10-31
related: conflicts textually with comp-ci-harden-workflows
-->

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f686138b2762`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.