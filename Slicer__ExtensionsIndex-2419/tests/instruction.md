# Issue

**Title:** Stream AI analysis output and bound its inference requests

## Description

Fixes the reporting and the cost problems described in #2418. Four changes, none
of which alters what the model is asked.

**The step no longer captures its own output.** `RESULT=$(python ...)` buffered
the whole analysis into a shell variable that is only echoed once the process
exits, so a job cancelled on timeout reported nothing at all: on #2411 the log
goes straight from the step header to `The operation was canceled.` after 30m17s,
with no indication of how far the analysis got. The script now streams to the
log through `tee`, and the step summary is written from that file. `set -o
pipefail` keeps the step failing when the script fails, which the pipe would
otherwise mask since the default shell is `bash -e {0}` and does not set it.

**A stalled inference request can no longer consume the job's whole budget.**
`requests.post` was called with no `timeout=`, so one unanswered connection hung
until the job timeout, silently. It now passes a `(connect, read)` pair, and the
existing per-question `except` path turns that into a visible error instead of a
cancelled check.

**The rate limiter no longer sleeps when nothing is owed.** The old code slept
`60 / INFERENCE_RESPONSE_PER_MINUTE_LIMIT` after every request including the
last, whatever the request itself had taken. `throttle()` now sleeps only the
remainder of the interval, so a request slower than the interval waits not at
all. On a repository that needs 61 requests this was 6.1 minutes of pure sleep.

**`timeout-minutes` goes from 30 to 60.** This is headroom, not a fix. The cost
of the analysis scales with the repository: because each request carries one
(question, batch) pair, a repository whose `.py` files fill 8 batches pays 5
source questions times 8 batches, or 40 requests of roughly 400,000 characters
each, and 61 in total. That is what exceeded 30 minutes on #2411 while
comparable submissions finish in 1 to 2 minutes.

The structural option, asking all the questions relevant to a batch in a single
request so the batch content is sent once rather than once per question, is left
out deliberately: it would cut that to 8 source requests, but five questions in
one prompt get shorter and less focused answers, and that is a judgment call
about review quality rather than a bug. #2418 describes it, along with capping
the total volume, if either is wanted.

Validated locally: `check-yaml` by parsing the workflow and reading back the new
`timeout-minutes` and run block; `trailing-whitespace`, `end-of-file-fixer`,
`mixed-line-ending` and `forbid-tabs` by inspection, the script file being
uniformly CRLF before and after; `scripts/check_repository_structure.py` passing;
and `throttle()` exercised on its three cases, first call waiting not at all,
an immediate second call waiting 6.00s, and a call 40s later waiting not at all.
`pre-commit` itself was not available in this environment, and the script needs
Python 3.12 to import, so it was not executed end to end.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f4e114c4db82`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.