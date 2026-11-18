# Issue

**Title:** EPFLP300: fix the unzip log record (argument without a placeholder)

## Description

`EPFLP300.data_path` logs `logger.info("unzip", path_zip)` when it extracts a subject archive. The path is passed as a `%`-argument but the message has no placeholder, so formatting the record raises `TypeError: not all arguments converted during string formatting`.

Stock logging handlers catch that and print a traceback to stderr. A handler that formats records strictly turns it into a failed load: a download audit with a request-logging handler hit it as

```
File ".../moabb/datasets/epfl.py", line 329, in _get_single_subject_data
...
TypeError('not all arguments converted during string formatting')
```

Fix: `logger.info("Unzipping %s", path_zip)`.

Regression test `moabb/tests/test_epfl.py` (offline): builds a one-file `subject1.zip`, replaces `dl.data_dl` by a function returning it, attaches a handler that formats every record and re-raises formatting errors, and checks the record reads `Unzipping <path>` and `data_path` returns the extracted file. It fails on `develop` with the `TypeError` and passes with the fix.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8d1035112e9c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.