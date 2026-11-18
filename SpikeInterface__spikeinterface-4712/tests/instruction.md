# Issue

**Title:** Fix channel order bug and make `select_channels` private

## Description

Fixes a channel order bug in the sparsity mask for the new `select_channels` method for analyzers.

Discussed with @alejoe91 and decided to keep this method private for now - we hope users will access through the `split_by` method rather than directly.

Fixed waveforms and pca selection.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `981705022075`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.