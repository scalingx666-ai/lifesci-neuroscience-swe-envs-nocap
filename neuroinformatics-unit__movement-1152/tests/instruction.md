# Issue

**Title:** Fall back to HTTP when sample data cannot be fetched over HTTPS

## Description

## Description

**What is this PR**

- [x] Bug fix
- [ ] Addition of a new feature
- [ ] Other

**Why is this PR needed?**

On the SWC internal network, `gin.swc.ucl.ac.uk` resolves to an internal host that serves only plain HTTP and refuses connections on port 443. There, `from movement import sample_data` fails with `ConnectionError ... [Errno 113] No route to host`, because the module downloads `metadata.yaml` over HTTPS at import time. CI and external users aren't affected.

**What does this PR do?**

Takes the same approach as brainglobe/brainglobe-stitch#77:

- Adds `HTTP_DATA_URL`, an `http://` version of `DATA_URL`.
- `_download_metadata_file` tries HTTPS first and retries over HTTP if that raises a `RequestException`.
- Adds `_fetch_with_http_fallback`, which wraps `SAMPLE_DATA.fetch` (used for poses/bboxes, frames, videos and zipped datasets). If the HTTPS download raises a `RequestException`, it logs a warning, switches `SAMPLE_DATA.base_url` to HTTP for the rest of the session and retries once.
- Hash mismatches raise `ValueError` and are not retried. Registry files are still checked against their SHA256 hashes, so the HTTP fallback keeps the integrity check.

## How has this PR been tested?

- New unit tests for the metadata fallback (HTTP succeeds / both fail), the registry fallback (HTTPS succeeds, HTTPS fails, hash mismatch is not retried) and no retry when HTTP is already in use.
- Ran `tests/test_unit/test_sample_data.py` on the SWC network, where HTTPS to GIN is refused: all pass. On `main`, the module can't even be imported there.
- Manually removed the cached `metadata.yaml` and imported `sample_data` / fetched a dataset on the SWC network: both succeed via HTTP.

## Is this a breaking change?

No.

## Does this PR require an update to the documentation?

No.

## Checklist:

- [x] The code has been tested locally
- [x] Tests have been added to cover all new functionality
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7e57de7f8cef`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.