# Issue

**Title:** neuralfetch: verify checksums and retry failed Figshare downloads

## Description

## What does this PR do?

`Figshare` used to write whatever `requests.get` returned straight to the final path. An expired presigned URL returns a small XML/HTML error page rather than the file, so a failed transfer silently landed as a corrupt dataset file that every later run then skipped as "already downloaded".

- Fetch each file's `computed_md5`/`supplied_md5` from the article metadata and verify the payload before keeping it; retry up to `max_retries` times and raise instead of saving a file that never matches.
- Download to a `.part` file and `replace()` into place, so an interrupted run cannot leave a partial file at the real path.
- `skip_existing` (default True) re-checks the MD5 of files already on disk and re-downloads the ones that do not match, which repairs datasets corrupted by the old behaviour.
- Drop the dead `Authorization: token ENTER-TOKEN` header (the public API needs no auth, and the placeholder was sent on every request).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `096c01a13f32`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.