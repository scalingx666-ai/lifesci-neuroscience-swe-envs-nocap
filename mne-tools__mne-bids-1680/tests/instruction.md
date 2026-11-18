# Issue

**Title:** ENH: Read sidecars without a lock and write them atomically

## Description

PR Description
--------------

Part of #1676. Related to #1451, #1573 and #1605.

**Reading a recording takes about 40% less time on a network filesystem, and writing is faster alone and in parallel.**

On main, every sidecar read takes a file lock, because a writer truncates the file and fills it again, so a reader could see it half-written. Here a write goes to a temporary file next to the target and is moved into place in one step. A reader always sees the old or the new file, so reads need no lock. This follows the comment in #1605 that only simultaneous writes need locking.

It is four small changes:

1. Files opened for writing through `_open_lock` are written to a hidden temporary file and moved over the target with `os.replace`. Symlinks are still written through (#1569), and the file keeps its permissions.
2. Files opened for reading take no lock. A plain overwrite takes none either; only read-then-write sequences (`participants.tsv`, `scans.tsv`, README, ...) keep it.
3. A sidecar whose content would not change is not rewritten, and `README`, `dataset_description.json` and `participants.json` skip the lock when they are already up to date.
4. Bug fixes: a reader that does not use the lock could see a partial file (see the last table); and `.bidsignore` was updated without a lock for BTi data.

**Measurements** (1,218 subjects, Lustre, `filelock` 4.0.12 active; calls from `strace -c -f`):

| Per operation | main | PR |
|---|---|---|
| `read_raw_bids`, system calls | 345–356 | 224 |
| `read_raw_bids`, time (full pass over 1,236 recordings, 4 rounds) | 33–37 ms | 18–23 ms |
| write one sidecar, changed content, system calls | 74 | 22 |
| write one sidecar, same content, system calls | 73 | 10 |
| `write_raw_bids`, median of 100 (3 rounds) | 92–108 ms | 68–76 ms |
| locks taken per `write_raw_bids` | 10 | 2 |

Parallel `write_raw_bids` into one dataset, recordings per second (320 subjects, 3 rounds):

| Workers | main | PR |
|---|---|---|
| 1 | 7.6–9.4 | 9.3–12.5 |
| 4 | 19–27 | 26–39 |
| 16 | 32–38 | 39–44 |
| 32 | 25–30 | 34–45 |

No `participants.tsv` row was lost in any run. Both versions stop scaling after about 16 workers; that is the `participants.tsv` lock, which this PR does not touch.

Concurrent access to one sidecar for 10 s:

| | main | PR |
|---|---|---|
| 1 writer + 3 readers, partial reads | 0 of ~1,000 | 0 of ~45,000 |
| 4 writers + 2 readers that take no lock, partial reads | 2,841–3,179 | 0 |

**Same output.** A scenario of six `write_raw_bids` calls with repeats, an edited README and a changed description writes the same 45 files, byte for byte, as main.

**Things to know.**
- A rewritten file is a new file on disk (new inode). An unchanged one keeps its modification time.
- If a writer is killed mid-write, a hidden `.<name>.<random>.tmp` file can stay behind. overwritten in place under the lock.

**AI disclosure.** I used Opus 5.5 to help write the code, run the benchmarks and draft this description. I reviewed all changes.

Merge checklist
---------------

Maintainer, please confirm the following before merging.
If applicable:

- [ ] All comments are resolved
- [ ] This is not your own PR
- [ ] All CIs are happy
- [ ] PR title starts with [MRG]
- [ ] [whats_new.rst](https://github.com/mne-tools/mne-bids/blob/main/doc/whats_new.rst) is updated
- [ ] New contributors have been added to [CITATION.cff](https://github.com/mne-tools/mne-bids/blob/main/CITATION.cff)
- [ ] PR description includes phrase "closes <#issue-number>"

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `52b38c5f81b9`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.