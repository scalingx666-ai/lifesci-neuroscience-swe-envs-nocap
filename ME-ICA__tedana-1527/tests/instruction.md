# Issue

**Title:** Cache OSF test data in CI and stop redundant downloads

## Description

Most of the recent CircleCI failures come from the `reclassify` job hitting OSF errors (500s from `osf.io/download/f6g45`, 403s from `files.osf.io`). The job was also downloading the dataset once *per test*: `download_test_data` compared OSF's "last updated" date with the mtimes of the files in the tarball, and for reclassify those never match (2023-02-16 vs. 2024-02-21). So every one of its ~11 tests fetched the data again, each one another chance to hit an OSF error. The five-echo files have mixed mtimes too, so whether its local copy was kept depended on which file the check picked.

Changes proposed in this pull request:

- Record OSF's "last updated" date in a `.osf_updated_date` file when a dataset is extracted, and compare against that instead of file mtimes. Existing local copies without the file are re-downloaded once.
- Query OSF metadata at most once per dataset per test session.
- Retry transient OSF failures (403/429/5xx, connection and read errors) with backoff and timeouts, and retry the whole download up to three times.
- Extract into a temporary directory and move it into place only once complete, so a failed download can't leave partial data behind (or get cached).
- If OSF is unreachable but the data are present, use the local copy. With no local data, attempt the download instead of failing on `listdir` of a missing directory.
- Cache each dataset on CircleCI (`t2smap` shares the five-echo cache), and the three-echo dataset used by the unit tests on GitHub Actions. Keys include a checksum of `tedana/tests/utils.py`, which holds the OSF IDs; bump `v1` in the key if a file is replaced on OSF under the same ID.

Notes for review:

- The first run on each new cache key still downloads; later runs should restore from cache.
- The GitHub Actions cache probably won't help the `py310-min` job, which installs tedana non-editably, so its data path is outside the checkout.
- Tested locally: the reclassify dataset downloads once and later calls hit the local copy; OSF outages fall back correctly; the external-metrics tests plus a subset of the reclassify integration tests pass (26 tests), with each dataset downloaded once.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e4dca4335cf8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.