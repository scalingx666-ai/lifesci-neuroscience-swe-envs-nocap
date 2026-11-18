# Issue

**Title:** ENH: Walk the dataset once in find_matching_paths and BIDSPath.match

## Description

Part of #1676.  and #1652.

**Searching a dataset now takes about half the time and 2 to 4 times fewer filesystem calls.**

On main, a root search runs one of five `glob`/`rglob` calls, then checks every returned path on disk three times. Here the tree is listed once with `os.scandir`, and no file is checked on its own.

It is four small changes:

1. `_return_root_paths` uses one `os.scandir` walk for all its cases, instead of five glob branches plus a per-file `is_file()`.
2. `_fnames_to_bidspaths` no longer asks whether each listed path exists (it did so twice). `get_bids_path_from_fname` is unchanged for its callers.
3. `read_raw_bids` lists each folder once when it looks up the sidecars of a recording.
4. Bug fix: a whole-dataset search with no `datatypes` and no `ignore_nosub` returned hidden files (and files in `.git`, `.datalad`, ...) and did not follow symlinked folders. Every other search already did the opposite, so now they all behave the same.

**Measurements** (1,218 subjects, 17,250 files, Lustre; system calls from `strace -c -f`, time is the median of 5 calls, middle of 3 rounds):

| Search | Paths | System calls, main → PR | Time, main → PR |
|---|---|---|---|
| whole dataset | 17,250 | 125,264 → 36,674 | 5.91 s → 3.08 s |
| `ignore_nosub=True` | 12,306 | 73,468 → 18,315 | 3.37 s → 1.83 s |
| `datatypes="eeg"` | 1,236 | 80,810 → 36,639 | 3.20 s → 1.95 s |
| `datatypes="eeg"`, `ignore_nosub=True` | 1,236 | 41,568 → 18,268 | 1.78 s → 1.13 s |
| one subject | 10 | not counted (too few) | 2.7 ms → 1.5 ms |

For the whole-dataset search, `stat` calls go from 66,564 to 7,330 and folder opens from 14,660 to 7,330.

On a 10× larger tree (12,180 subject folders): `ignore_nosub=True` 41–45 s → 19–25 s, `datatypes="eeg"` 20–21 s → 11.5–12 s.

Per `read_raw_bids` (locks on): 356 → 322 calls (`stat` 106 → 85, directory reads 12 → 6). I did not time this one; the gain is below the noise.

**Same results.** Both versions find the same number of paths in every search above. On a test tree with hidden files and folders, symlinks, broken symlinks, `.ds` folders and nested datatype folders, 7,382 searches and sidecar lookups differ from main only in the two cases of the bug fix.

**Tests.** One test added for the hidden-file fix. The expected counts in `test_path_benchmark` changed because the counter now sees every entry the walk lists; glob listed the same folders, but only the paths it yielded could be counted. The symlinked-folder fix has no test of its own, since creating symlinks can fail on Windows CI; happy to add one if needed.

**AI disclosure.** I used Opus 5.5 to help write the code, run the benchmarks and draft this description. I reviewed all code changes.

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `fc2b0c501f16`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.