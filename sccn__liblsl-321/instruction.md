# Issue

**Title:** Reject legacy feeds on sync outlets (#311) + follow-ups

## Description

Carries @zeyus's #311 forward (their commit is included unchanged) with `dev` merged in and three follow-ups from review. Supersedes #311; we couldn't push to the fork.

**From #311:** a synchronous outlet only writes data protocol 1.10 samples, so it now rejects streamfeed requests that would use 1.00 (legacy requests: connection closed; 1.10 requests downgraded to 1.00: `505` with the reason) instead of sending data the inlet cannot parse.

**Follow-ups**
- Merge `dev`: the test wrapper uses `tcp_server`'s new `io_context&` constructor; both new tests kept.
- The new test ran `ctx.run()` until every connection closed, so a regression (server keeps the legacy feed open) hung instead of failing. It now runs for at most 5 s and requires all three responses. Verified: with the rejection disabled it fails in ~6 s.
- `Endian-Performance` was parsed with `std::stod`, which honors `LC_NUMERIC`: the same bug as #310 (a comma-decimal outlet read `1.23457e+07` as 1). Now `from_string<double>`.
- The rejection warning is logged in debug builds only: a rejected inlet retries every 500 ms, so release outlets would log it twice a second per inlet. 1.10 inlets get the reason in the 505 response.

Tested locally (macOS arm64): `[network]` internal tests, `[sync]` and all exported tests pass.

Supersedes #311

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `79fa78515b4d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.