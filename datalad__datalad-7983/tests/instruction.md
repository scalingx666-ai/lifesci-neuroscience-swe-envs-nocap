# Issue

**Title:** Fix the remaining maint cron failures (minimum-Git build, parallel result ordering, binary-data download)

## Description

> [!IMPORTANT]
> **Drop the last commit (`TEMP: CI: run the minimum-Git job on this PR`) before merge.** It removes `cron-only` from the minimum-Git entry so the `ubuntu-24.04` pin is actually exercised here (16 test jobs instead of 15). Drop the commit — do not `git revert` it.

## Summary

Every distinct failure left on the maint cron after #7970. Run [40872572540](https://github.com/datalad/datalad/actions/runs/40872572540) was 25 green / 2 red, and a third failure has since shown up twice; the three are unrelated to each other.

**`Install minimum Git` — a build failure, not a test failure.** Red on every cron since 2026-10-26, when `ubuntu-latest` moved to 26.04 ("resolute") and libcurl 8.18. Git 2.31.0 (our `GIT_MIN_VERSION`, from 2021) has a shim in `http.h` for libcurl < 7.16.4 whose guard still fires on a modern libcurl — `CURLOPT_USE_SSL` is an enum there rather than a `#define`, while `CURLOPT_FTP_SSL` survives as a deprecated one. libcurl 8.18 dropped `CURLFTPSSL_TRY`, so the shim expands to an undeclared identifier and `imap-send.o` fails. Pinned the job to `ubuntu-24.04`: it exists to run the suite against the oldest Git we support, not to keep that Git compiling on the newest Ubuntu.

**`test_producer_future_key` — a wrong assertion, ~40-75% flaky.** It expected `ProducerConsumer` to preserve the producer's order at every `jobs` value, which the class has explicitly disclaimed since the same day the test was written.

<details><summary>Why the ordering assertion was wrong — the history</summary>

| When | What |
| ---------- | ------------------------------------------------------------------------------------- |
| 2020-10-19 | 7340ab8c5 adds `producer_future_key`; its test asserts `list(pc) == [0, 1, 2]` across the whole sweep (`"auto"`, `None`, `1`, `10`) |
| 2020-10-19 | da7fe50ed, same day and author, documents "with jobs > 1, results are yielded as soon as available, so order might not match the one provided by `producer`" |
| 2024-12-14 | d8eed5001 `test: there cannot be assumption of the order matching` — "really there is nothing which should force original order. So we can just test overall set." Applies list → set to the sibling `test_producing_consumer` immediately above, but misses this test |
| later | two imperative `xfail`s accrue on the missed test, for Python 3.13 and for Windows, both at `jobs=10` — treating one wrong assertion as two platform quirks, and leaving Linux/3.10 exposed |

`producer_future_key` is documented as a key function "used as a key in futures dictionary and output of which is passed to safe_to_consume" — it was never an ordering mechanism.

Measured locally, 100 runs per value — only a serial run is ordered:

| `jobs` | effective | in order |
| ------- | --------- | --------- |
| `1` | 1 | 100/100 |
| `"auto"` | 3 | 65/100 |
| `None` | 3 | 46/100 |
| `10` | 10 | 26/100 |

So the strict assertion is now keyed off `get_effective_jobs()`, which resolves `"auto"`/`None` through `datalad.runtime.max-jobs`, and sets are compared otherwise. Both `xfail`s become unnecessary and are dropped, as are the `sys` and `on_windows` imports they were the only users of.

</details>

**`test_binary_data` — six years of not testing binary data.** The URL it downloaded is a github *blob page*, not the file behind it, so it comes back as `text/html; charset=utf-8`. A test whose whole reason to exist is to "make sure, special remote deals with binary data and doesn't accidentally involve any decode/encode etc." has been round-tripping an HTML document since 613a1a1e9 (2020-05-13) — whose own message says the payload "is completely irrelevant as long as it's binary". It also made the test hostage to github being healthy, and both recent failures were github 5xx with the network plainly up: 504 on 2026-11-05, and 503 on 2026-10-11, which took down three jobs at once.

Now the content is generated locally — all 256 byte values, which is both undecodable as UTF-8 and contains a NUL, so a stricter probe than any real DICOM — and the bytes are asserted to survive the move/get round trip, the check the test is named for and never actually made. No network, and the local variant runs in 2.9 s.

<details><summary>Why the local variant was never running either</summary>

`skip_ssh` raises `SkipTest`, and both variants shared one test body:

```python
def test_binary_data():
    known_failure_windows(skip_ssh(_test_binary_data))('datalad-test')
    skip_if_no_network(_test_binary_data)(None)   # never reached without SSH
```

So without `DATALAD_TESTS_SSH` — the default for a local run, and explicitly `0` for three CI jobs — the whole test reported as `skipped` and the local half was dead code. Split into `test_binary_data_ssh` / `test_binary_data_local`, which is how `_test_gitannex`'s wrappers have been arranged since d8b7b8b0b (2020-04-17); `test_ria_basics.py` goes from 8 passed / 10 skipped to 9 passed / 10 skipped here, with no SSH host configured.

</details>

## Test plan

- [x] `test_producer_future_key` across all four `jobs` values, 25 repeats — 100/100 invocations green, against a ~62% failure rate for `jobs=10` beforehand.
- [x] Full `datalad/support/tests/test_parallel.py`: 20 passed.
- [x] `test_binary_data_local` passes with no network access to github and no SSH host; `test_ria_basics.py` 9 passed / 10 skipped.
- [x] Matrix still 26 entries; exactly one pinned to `ubuntu-24.04`.
- [ ] **CI here:** the minimum-Git job builds and the suite passes on `ubuntu-24.04` — that is what the TEMP commit is for.
- [ ] **CI here:** `test_binary_data_ssh` passes on the jobs that do provision sshd.
- [ ] Drop the `TEMP:` commit before merge.
- [ ] Label `semver-internal`.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

https://claude.ai/code/session_01R33PxKstUam1VpAd94LGR6

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `dec496e2cb48`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.