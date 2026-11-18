# Issue

**Title:** BF+TST+CI: fix three matrix failures from cron 25247128617

## Description

## Summary

Fix three matrix failures observed on the `maint` cron run [25247128617](https://github.com/datalad/datalad/actions/runs/25247128617) (2026-05-02), each in its own commit so they can be picked individually if needed, plus a small VCR-cassette refactor that makes shipping cassettes alongside tests actually work.

While investigating the third failure (NFS chunks hitting GitHub's 6h job-timeout cap), the **actual root cause** of the chronic cron-NFS cancellations turned up: the `annex.pidlock=true` workaround in `.github/workflows/test.yml` — a v7-era flock-on-NFSv3 mitigation — became the dominant cost on NFS after the v8→v10 git-annex bump in #7693, multiplying every git-annex lock op by ~50–100×. Removing it (commit `08f572082`) restores pre-v10 NFS performance: cron NFS jobs went from chronically cancelled at 6h since Oct 31, 2025 (~6 months of red runs) to completing in 13–27 minutes per chunk in this PR's CI.

## Commits

- 8e343309a `RF(TST): discover VCR cassettes next to the calling test module`
- 2a0dddacf `BF(TST): ship VCR cassette for test_anonymous_s3`
- 9eb81c610 `CI: retry SSH-target docker setup on host port collisions`
- fb2b69ca3 `DOC: scriv changelog fragment for PR #7852`
- be697504a `CI: export NFS test mount with (rw,async) to avoid 6h cron timeouts`
- a44bedc8f `CI: capture per-test timings as a pytest-reportlog artifact`
- db23b45f0 `TEMP: PR-only, all-cron-jobs Test workflow for validation` — **DROP BEFORE MERGE**
- 4e860f39a `RF: tools/eval_under_nfs: default to async, add DATALAD_TESTS_NFS_SYNC`
- 08f572082 `CI: drop annex.pidlock=true NFS workaround for the v8 era`

<details><summary>Per-commit details</summary>

### 8e343309a `RF(TST): discover VCR cassettes next to the calling test module`

`@use_cassette('name')` now resolves to `<test_module_dir>/vcr_cassettes/<name>.yaml` (caller-relative, via `sys._getframe`) before the legacy CWD-relative `fixtures/vcr_cassettes/<name>.yaml` fallback. No call sites change. Adds unit tests for the resolver.

### 2a0dddacf `BF(TST): ship VCR cassette for test_anonymous_s3`

Cron run 25247128617's `test (3.10)` matrix failed `test_anonymous_s3` with a transient `NoSuchBucket` from `s3://openneuro.org/ds000001/...` while six sibling matrix runs that hit the same endpoint within minutes passed — a clear flaky-network signature. The test was decorated with `@use_cassette('test_anonymous_s3')` but no cassette had ever been shipped (gitignored `fixtures/`), so VCR fell through to live S3 every cron run. With the previous commit's resolver, dropping the cassette next to `test_s3.py` is enough; no test_s3.py change.

Cassette content review: only public openneuro.org `dataset_description.json` (CC0), anonymous HEAD/GET, no auth headers, no signed tokens. Verified to be picked up: cassette in place + broken proxy → PASS instantly; cassette removed + broken proxy → FAIL with `ProxyConnectionError`.

Packaging: confirmed by `python -m build --wheel` that the cassette is auto-included via `include-package-data = true`, no `pyproject.toml` change needed.

### 9eb81c610 `CI: retry SSH-target docker setup on host port collisions`

The `collide` matrix entry exited 125 because the upstream `setup-docker-ssh` script's container 2 failed to bind port 42242 (`address already in use`). Wrap the call in a 3-attempt retry loop with pre-flight `/dev/tcp` port probing, who-holds-the-port logging (ss / lsof / fuser / docker ps), and `docker rm -f` cleanup between attempts so upstream's "containers already running" guard does not block retry. Happy path is unchanged.

### fb2b69ca3 `DOC: scriv changelog fragment for PR #7852`

Hand-written `changelog.d/pr-7852.md` summarising the user-visible changes under 🧪 Tests.

### be697504a `CI: export NFS test mount with (rw,async)`

Changes the NFS export options from default `(rw)` (= `sync`) to `(rw,async)`. Marginal speedup (~10–25% per write op locally), but more importantly tests under the export configuration that production NFS servers actually use. Local-bench supporting numbers in .

### a44bedc8f `CI: capture per-test timings as a pytest-reportlog artifact`

Adds `--report-log=pytest-report.jsonl` to the pytest invocation and an `if: always()` artifact-upload step. Future safety-net for diagnosing slow / cancelled jobs. Requires `pytest-reportlog` (added to the `tests` extras).

### db23b45f0 `TEMP: PR-only, all-cron-jobs Test workflow for validation` — **DROP BEFORE MERGE**

Forces cron-only matrix entries to run on every PR push, and disables the workflow's `push:`/`schedule:` triggers so we don't generate noisy duplicate runs while iterating.

### 4e860f39a `RF: tools/eval_under_nfs: default to async, add DATALAD_TESTS_NFS_SYNC`

Local NFS-test helper now mirrors the CI workflow's `(rw,async)` export. `DATALAD_TESTS_NFS_SYNC=1` keeps the old sync behavior available for reproducing the worse-case CI condition locally.

### 08f572082 `CI: drop annex.pidlock=true NFS workaround for the v8 era`

The actual root-cause fix for the chronic 6h cron cancellations. Single 7-line deletion of the `Git-annex workaround for NFS mounts` step in `.github/workflows/test.yml` (added in 46b86fb57, Feb 2020, "TST: Use annex.pidlock=true to overcome NFS issues"). Its wrapping comment already said `# TODO: remove - should not be needed`. v10 + NFSv4.2 handles fcntl natively; pidlock's polling per-acquire was multiplying every git-annex lock op by ~50–100× under NFS.

</details>

<details><summary>Empirical NFS speedup (run 25503781673 with pidlock vs run 25585554630 without)</summary>

| Job | with pidlock | without pidlock | Speedup |
| --- | ---:| ---:| ---:|
| Scoped NFS (`datalad.tests datalad.support`) | 1h21m ✅ | 16m31s ✅ | ~5× |
| `datalad.core datalad.distribution` | cancelled at 6h05m | 27m14s | >13× |
| `datalad.distributed datalad.downloaders datalad.local` | cancelled at 6h05m | 21m29s | >17× |
| `datalad.cli datalad.cmdline …` | cancelled at 6h05m | 13m41s | >26× |

After validating the speedup, the previous-iteration's 3-way NFS chunk-split (`d895bc854`) was reverted: a single full NFS job now suffices.

</details>

## Test plan

- [x] `RF(TST)`: 3 unit tests in `datalad/support/tests/test_vcr_.py` exercise absolute-path passthrough, caller-relative discovery, and the legacy fallback — PASS locally.
- [x] `BF(TST)`: `test_anonymous_s3` replays from the new cassette under a broken proxy locally; without the cassette, breaks with `ProxyConnectionError` — proves the cassette is on the lookup path.
- [x] CI: with the TEMP commit in place, all NFS jobs finish well under the 6h cap (run 25585554630).
- [x] CI: SSH retry diagnostics never had to fire (no port collision), but `Install dependencies` step on `collide` ran cleanly.
- [x] **Drop TEMP commit `db23b45f0` before merge.**
- [ ] Open follow-up issue for the 11 NFS test failures unmasked by the pidlock removal (out of scope here; tracked separately).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f8e56d384fd1`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.