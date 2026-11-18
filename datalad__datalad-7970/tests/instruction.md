# Issue

**Title:** Fix the consistent maint cron failures (unannex --json on old git-annex, flaky /// tests, NFS job SSH)

## Description

## Summary

The `maint` cron ([test.yml](https://github.com/datalad/datalad/actions/workflows/test.yml)) has been red for 11 of the last 12 scheduled runs. Reviewing all of them, the failures are four distinct things, three of which are fixed here:

| What                                          | Failing since | Fix                                         |
| --------------------------------------------- | ------------- | ------------------------------------------- |
| `pixi==10.20230126` job: `unannex --json`     | 2026-10-04    | version gate (a real bug, shipped in 1.6.6) |
| 14–17-job spikes: datasets host unreachable   | recurring     | `@skip_if_no_network(url=...)` on 7 tests   |
| NFS-complement job: 21 SSH tests              | always        | `DATALAD_TESTS_SSH: "0"`                    |
| `git-annex -m datalad/packages` job: HTTP 404 | 2026-10-07    | fixed server-side on 2026-10-14, not here   |

**The one genuine bug.** 002cc0195 (released in 1.6.6) routed `AnnexRepo.unannex()` through `call_annex_records()`, i.e. `git annex unannex --json --json-error-messages`. git-annex only grew those options for `unannex` in its **10.20230626** release, while `AnnexRepo.GIT_ANNEX_MIN_VERSION` is `10.20230126` — which is also what Debian bookworm ships. On anything older the call dies with ``Invalid option `--json'``. It is now gated through the existing `_check_version_kludges()` table, with the pre-002cc0195 parsing of the human-readable output as the fallback.

**The spikes.** Four of the twelve runs (Oct 2/6/10/12) jumped from 3 failing jobs to 14–17. Aggregating those runs' `pytest-report.jsonl` artifacts, every extra failure is one of seven tests cloning from `///` while `datasets-tests.datalad.org` was unreachable. All used bare `@skip_if_no_network`, which only says whether there is network at all, not whether that host answers; they now use the `url=` form added in gh-7912 for exactly this.

**The NFS job.** It has failed on every scheduled run since it was split out, and all 21 failures are SSH tests. The cause is step ordering in `test.yml`: `tools/ci/prep-travis-forssh.sh` starts the SSH target container with `-v /tmp:/tmp` during provisioning, *before* the next step NFS-mounts `/tmp/nfsmount`. A docker bind mount is an `rprivate` rbind snapshot taken at container start, so that later mount never propagates in — inside the container `/tmp/nfsmount` is the empty directory the host stacks NFS on top of, and every path the test just created is invisible to the target. SSH is now off there, as in the scoped NFS job above it. Mounting NFS before provisioning would give real SSH-over-NFS coverage instead; noted on #7624 rather than done here.

<details><summary>The fourth one, which was never a datalad bug (resolved)</summary>

The `git-annex -m datalad/packages` job has 404'd since 2026-10-07:

```
datalad_installer: Found latest version: 10.20261006
datalad_installer: Downloading https://datasets.datalad.org/datalad/packages/neurodebian/git-annex-standalone_10.20261006-1~ndall+1_amd64.deb
urllib.error.HTTPError: HTTP Error 404: Not Found
```

Against the live server:

- `datalad/packages/latest-version` → `10.20261006`
- `datalad/packages/neurodebian/` → newest is `git-annex-standalone_10.20260901-1~ndall+1_amd64.deb`
- `datalad/packages/osx/` → has `git-annex_10.20261006_x64.dmg`
- `datalad/packages/windows/` → has `git-annex-installer_10.20261006_x64.exe`

So macOS and Windows artifacts for 10.20261006 were published and `latest-version` was bumped, but the NeuroDebian amd64 `.deb` never landed; Oct 4–6 runs still resolved 10.20260901 and installed fine. The root cause was a one-day gap upstream: [the con/git-annex release](https://github.com/con/git-annex/releases/tag/10.20261006) was published 2026-10-06T18:00:22Z with only the Windows and macOS assets, and the Debian ones were uploaded 2026-10-07T16:48:50Z -- after whatever mirrors `neurodebian/` had already run.

**Resolved 2026-10-14**, outside this PR: the missing `.deb` has been uploaded, so the URL datalad-installer builds returns 200 again. The job is in the TEMP matrix as a normal (non-`allow-failure`) entry to confirm that.

</details>

<details><summary>Per-run failure counts</summary>

| Date (UTC) | Run                                                                        | Failing jobs |
| ---------- | -------------------------------------------------------------------------- | ------------ |
| 2026-10-14 | [38555467669](https://github.com/datalad/datalad/actions/runs/38555467669) | 3            |
| 2026-10-13 | [38406621923](https://github.com/datalad/datalad/actions/runs/38406621923) | 3            |
| 2026-10-12 | [38263664219](https://github.com/datalad/datalad/actions/runs/38263664219) | 14           |
| 2026-10-11 | [38138283424](https://github.com/datalad/datalad/actions/runs/38138283424) | 5            |
| 2026-10-10 | [38050288707](https://github.com/datalad/datalad/actions/runs/38050288707) | 17           |
| 2026-10-09 | [37931402950](https://github.com/datalad/datalad/actions/runs/37931402950) | 3            |
| 2026-10-08 | [37780081086](https://github.com/datalad/datalad/actions/runs/37780081086) | 4            |
| 2026-10-07 | [37623101465](https://github.com/datalad/datalad/actions/runs/37623101465) | 3            |
| 2026-10-06 | [37466106995](https://github.com/datalad/datalad/actions/runs/37466106995) | 16           |
| 2026-10-05 | [37319041652](https://github.com/datalad/datalad/actions/runs/37319041652) | 2            |
| 2026-10-04 | [37200060074](https://github.com/datalad/datalad/actions/runs/37200060074) | 2            |
| 2026-10-02 | [37003863796](https://github.com/datalad/datalad/actions/runs/37003863796) | 14           |

</details>

## Test plan

- [x] `test_unannex_etc` passes on the installed git-annex (10.20260901), i.e. via the `--json` path.
- [x] `test_unannex_etc` passes with the `--json` kludge forced off, i.e. via the fallback path; the fallback demonstrably returns the right count with the tab mangled back to a literal `\t`, which is what the `--json` path avoids.
- [x] Version gate checked at the boundary: `10.20230625` → fallback, `10.20230626` → `--json`.
- [x] The seven `///` tests all skip under `DATALAD_DATASETS_TOPURL=https://datasets-tests.invalid/`, and still run and pass under the real one.
- [x] Full `datalad/support/tests/test_annexrepo.py`: 88 passed, 6 skipped.
- [x] All four previously-failing cron jobs run green, verified under a temporary 4-job matrix which has since been dropped (run [38672249018](https://github.com/datalad/datalad/actions/runs/38672249018)):

  | Job                               | Before                        | Under this PR             |
  | --------------------------------- | ----------------------------- | ------------------------- |
  | `pixi==10.20230126`               | 1 failed (`test_unannex_etc`) | 1410 passed, 0 failed     |
  | NFS complement                    | 21 failed                     | 819 passed, 0 failed      |
  | `git-annex -m datalad/packages`   | died at install (HTTP 404)    | 1408 passed, 0 failed     |
  | plain Linux (the `///` tests)     | —                             | 1408 passed, 0 failed     |

- [x] Label `semver-patch`.
- [ ] `allow-failure: true` is still on the NFS-complement entry. It ran *without* it above and was clean, so it can come off — kept for now so one real cron run confirms it, as the commit message says. Follow-up, not a blocker.
- [ ] `codecov/project` and `codecov/patch` are red only because `test.yml` skips coverage on draft PRs by design; taking this out of draft fires `ready_for_review` and re-runs with coverage. The red `test` check is the `Test for semver label` run from before the label was applied — its re-run passed.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `77de8d9eb4ee`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.