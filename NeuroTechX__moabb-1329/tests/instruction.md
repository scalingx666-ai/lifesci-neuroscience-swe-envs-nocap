# Issue

**Title:** Add minimal integer-only PurgedEpochKFold for raw epoch windows

## Description

## Why this smaller PR

This is the **minimal opt-in follow-up** requested by @bruAristimunha in #1235 for the raw-epoch-overlap concern in #280. The original large PR #1235 has now been **closed as superseded**. This PR deliberately contains **only three files**: one standalone splitter, focused tests, and the changelog.

### Behavior and exact contract

- Add `PurgedEpochKFold` in `moabb/evaluations/splitters.py`. Each recording is partitioned into near-equal **contiguous chronological** test blocks; training epochs are purged only when their **half-open integer raw epoch intervals** intersect the held-out windows.
- `groups` is an explicitly supplied `(n_epochs, 3)` array of `(recording_id, event_sample, epoch_n_samples)`; run identities can be hashable `(subject, session, run)` tuples. They are encoded as scalar group IDs to prevent NumPy tuple-broadcast comparison errors. Missing IDs (`None` or `NaN`, including within tuple IDs), invalid sample types, and int64 overflow fail closed.
- The overlap lookup uses sorted interval starts and prefix-maximum stops; **O((N+M) log M)** time, linear auxiliary memory. Reject folds without required train/test class support rather than silently balancing classes.
- **No** changes to `BaseParadigm`, evaluation classes, automatic metadata injection, preprocessing, default splitters, API exports, or upstream CI files. No dynamic-programming class balancing or float-coordinate handling.

### Scientific boundary (deliberate)

This only prevents *direct overlap of declared raw epoch extraction windows*. It **does not prove independence** after continuous-recording preprocessing (such as zero-phase IIR/FIR filtering), learned transforms, or fitted scalers. This is not a complete resolution of #280, and no EEG benchmark/AUC gain is claimed. Filter-aware research remains in a separate **fork-only** branch, outside this upstream PR.

### Exact-head verification (2026-10-26 00:24 UTC)

Current head: `0ebd0f05c3e8538b2a50286b7ab2e70f6756e0b5`. A maintainer merged the latest `develop` into the branch; the PR diff still contains only the standalone splitter, focused tests, and changelog.

- **Official MOABB Test: in progress** on this exact head: https://github.com/NeuroTechX/moabb/actions/runs/40249187768 . The previous `fd999cd2` head passed the full multi-OS/Python Test matrix: https://github.com/NeuroTechX/moabb/actions/runs/40218418101 . Do not treat that earlier result as current-head CI.
- **Docs: Success**: https://github.com/NeuroTechX/moabb/actions/runs/40249187767 .
- **Braindecode integration: Success**: https://github.com/NeuroTechX/moabb/actions/runs/40249187788 . The maintainer has also clarified this is *not* a required check.
- **What's New: Success**: https://github.com/NeuroTechX/moabb/actions/runs/40249187812 .
- **pre-commit.ci: Success** on the current head.
- **Link Check: Failure**: https://github.com/NeuroTechX/moabb/actions/runs/40249187776 . The log identifies only two pre-existing `https://github.com/qinxwew` links in `docs/source/whats_new.rst` (HTTP 404). The maintainer explicitly restored those upstream-baseline links and requested any unrelated link fix separately; this PR does not change them.
- Focused regression tests cover tuple-valued IDs, missing/NaN IDs, identity isolation, chronological partitioning, class-support validation, exact half-open interval boundaries, dense independent overlap oracle, integer/overflow rejection, and large-cohort complexity.

**Remaining acceptance:** the maintainer has confirmed the minimal scope is acceptable and intends to merge after required checks pass; the current Test matrix is still running. Link Check is a known baseline failure, not a regression introduced by this PR. The branch is mergeable without git conflicts. No separate CI or unrelated changelog fixes are proposed here.

Original design discussion:  .

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a02de4530030`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.