# Issue

**Title:** BF: retry interrupted downloads, report how far they got, stop repeating the cause

## Description

Addresses : a multi-GiB download failed on a dropped connection, with no retry, no way to tell a truncated response from a full disk, and the same `IncompleteRead` repeated several times in one message.

- **Retry** — a connection lost mid-transfer is retried, up to the new `datalad.downloaders.retry` (default 5, also bounding HTTP 429 and 5xx retries), with capped backoff; each retry is logged with its reason. A retry restarts from the beginning; resuming is left for later.
- **Report** — a failure says how much was stored and, when the file system is short on room, how much is free. Running out of space is not retried, and a download that cannot fit is warned about upfront.
- **Don't repeat** — a cause its wrapper already shows is not appended again (the rest of the chain still is), and the result renderer no longer prints `error_message` next to a `message` containing it.

`tools/flaky-httpd` serves truncated, reset, stalled and throttled responses to try it out:

```
tools/flaky-httpd &
datalad download-url 'http://127.0.0.1:8378/flaky?size=8388608&after=1048576&fail=2'
datalad download-url 'http://127.0.0.1:8378/truncate?size=8388608&after=65536'
```

**Compatibility:** a `DownloadError`'s message no longer includes its cause's text; use `__cause__`. More data than announced (`UnaccountedDownloadError`) is no longer retried.

**Open:** `requests.ConnectionError` in `_TRANSIENT_EXCEPTIONS` also covers `requests.SSLError`, so a bad TLS certificate gets retried; `pbar.finish()` is unguarded ahead of `fp.close()`. The NFS `test_ro_operations` failure is unrelated ().

🤖 Generated with [Claude Code](https://claude.com/claude-code)

https://claude.ai/code/session_013m5MzNhSSqCCwSBE6mve7i

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c98fe468333b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.