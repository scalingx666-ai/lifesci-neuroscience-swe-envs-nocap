# Issue

**Title:** ENH: Parse participants.tsv once in read_raw_bids

## Description

PR Description
--------------

Part of #1676.

**`read_raw_bids` no longer parses `participants.tsv` on every call.**

On main, every `read_raw_bids` parses the whole `participants.tsv` to pick one row, so the cost of one read grows with the number of participants in the dataset.

Two small changes:

1. The parsed `participants.tsv` is kept with `functools.lru_cache`, keyed on the file's bytes. The bytes are read on every call, so a rewrite is always seen, even one that keeps the same size and timestamp. Only the last table is kept.
2. `_drop` builds the filtered table directly instead of deep-copying the table first.

**Measurements** (Lustre; cost of the participants step per `read_raw_bids`, median after the first call):

| Participants | main | PR |
|---|---|---|
| 1,000 | 1.8 ms | 0.4 ms |
| 10,000 | 11.7 ms | 0.5 ms |
| 50,000 | 61.8 ms | 0.9 ms |

| Full pass over the dataset | main | PR |
|---|---|---|
| 10,000 reads, 10,000 participants | 261.5 s | 181.7 s |
| 50,000 reads, 50,000 participants | 52.2 min | 23.5 min |

On a dataset with about 1,200 participants the gain is small, a few seconds over a full pass. It matters for large datasets.

**Test.** One test added through `write_raw_bids` and `read_raw_bids`: a rewrite of `participants.tsv` that keeps the file size and the timestamp is still picked up.

**Edit after review.** An earlier version also changed `_from_tsv` to read each file once. It used more memory and was slower on large files, so it was removed.

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `cd32e35ff9fb`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.